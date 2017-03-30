require 'rest-client'
require 'addressable/uri'
require 'oauth2'
require 'pry'

module FHIR
  # Ruby Client for FHIR requests, handling metadata, get, post, etc.
  # Basic usage:
  # client = FHIR::Client.new('https://fhir.example.com/fhir')
  # client.read(FHIR::Patient, id)
  class Client
    ACCEPT_HEADER_TYPES = {
      (1.8..3.0) => {
        json: 'application/fhir+json',
        xml: 'application/fhir+xml'
      },
      (1.0...1.8) => {
        json: 'application/json+fhir',
        xml: 'application/xml+fhir'
      }
    }.freeze

    include FHIR::URIHelper

    attr_accessor :iss, :http_client
    attr_reader :accept_type, :fhir_version

    def initialize(iss)
      @iss = Addressable::URI.parse(iss)
      @fhir_version = FHIR::VERSION.to_f
      use_no_auth!
      use_json!
    end

    def read(resource_class, id)
      path = resource_url(resource_class, id: id).to_s
      ClientReply.new(
        response: http_client.get(path, fhir_headers),
        resource_type: resource_class
      )
      # TODO: Put note here about what ExceptionWithResponse is.
    rescue RestClient::ExceptionWithResponse => http_error
      ClientException.new(response: http_error)
    end

    def search(resource_class, params = {})
      path = resource_url(resource_class, params).to_s
      ClientReply.new(
        response: http_client.get(path, fhir_headers),
        resource_type: resource_class
      )
    rescue RestClient::ExceptionWithResponse => http_error
      ClientException.new(response: http_error)
    end

    def create(resource_class, body, options = {})
      path = resource_url(resource_class, options).to_s
      ClientReply.new(
        response: http_client.post(path, body.to_json, fhir_headers),
        resource_type: resource_class
      )
    rescue RestClient::ExceptionWithResponse => http_error
      ClientException.new(response: http_error)
    end

    def capability_statement
      @capability_statement ||= begin
        ClientReply.new(
          response: http_client.get(capability_url) # See if this pans out with Grahame's server, etc. (since it's not asking for json/etc)
        ).resource.tap do |capabilities|
          @fhir_version = capabilities.fhirVersion.to_f
          # TODO: Include? logic might need tweaking
          select_mime_type!(capabilities.format.first) unless capabilities.format.include?(@accept_type)
        end
      end
    end
    alias conformance_statement capability_statement

    def select_mime_type!(format)
      @accept_type = mime_types_for(@fhir_version).detect { |abbr, mimetype| mimetype == format || abbr.to_s == format }.first
    end

    def use_json!
      @accept_type = :json
    end
    alias default_json use_json!
    deprecate :default_json

    def use_xml!
      @accept_type = :xml
    end
    alias default_xml use_xml!
    deprecate :default_xml

    def use_format_param?
      @use_format_param ||= false
    end
    alias use_format_param use_format_param?

    def use_format_param!(value = true)
      @use_format_param = value
    end

    def use_no_auth!
      @http_client = NoAuthClient.new
    end
    alias set_no_auth use_no_auth!

    # TODO: Should the args here be id/secret or key/secret?
    def use_basic_auth!(username, password)
      @http_client = BasicAuthClient.new(username, password)
    end
    alias set_basic_auth use_basic_auth!

    def use_bearer_token!(token)
      @http_client = BearerTokenClient.new(token)
    end
    alias set_bearer_token use_bearer_token!

    def use_oauth2_auth!(client_id, client_secret, authorize_url, token_url)
      options = {
        site: iss,
        authorize_url: authorize_url,
        token_url: token_url,
        raise_errors: true,
        connection_opts: {
          headers: fhir_headers
        }
      }
      client = OAuth2::Client.new(client_id, client_secret, options)
      @http_client = client.client_credentials.get_token
    end
    alias set_oauth2_auth use_oauth2_auth!

    def oauth2_urls
      capability_statement.oauth2_urls
    end
    alias get_oauth2_metadata_from_conformance oauth2_urls

    private

    def capability_url
      iss.merge(path: [iss.path, 'metadata'].compact.join('/')).to_s
    end

    def fhir_headers
      return {} if use_format_param?
      {
        'Accept' => mime_types_for(fhir_version)[accept_type]
      }
    end

    def mime_types_for(fhir_version = @fhir_version)
      ACCEPT_HEADER_TYPES.detect { |versions, _values| versions.include? fhir_version }.last
    end
  end
end
