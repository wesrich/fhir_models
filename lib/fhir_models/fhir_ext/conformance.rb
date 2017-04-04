module FHIR
  class Conformance
    def oauth2_urls
      @oauth2_urls ||= begin
        urls = rest.map { |rest_item| rest_item.security.try(:oauth2_urls) }.compact.first
        FHIR.logger.error 'Failed to locate SMART-on-FHIR OAuth2 Security Extensions!' unless urls.present?
        urls
      end
    end

    class Rest
      class Security
        OAUTH_EXTENSION = 'http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris'.freeze
        AUTHORIZE_EXTENSION = 'authorize'.freeze
        TOKEN_EXTENSION = 'token'.freeze

        def oauth2_urls
          return unless extension.any? && smart_on_fhir_service?
          urls = {}
          extension.detect { |ext| ext.url == OAUTH_EXTENSION }.extension.each do |ext|
            case ext.url
            when AUTHORIZE_EXTENSION, "#{OAUTH_EXTENSION}\##{AUTHORIZE_EXTENSION}"
              urls[:authorize_url] = ext.value
            when TOKEN_EXTENSION, "#{OAUTH_EXTENSION}\##{TOKEN_EXTENSION}"
              urls[:token_url] = ext.value
            end
          end
          urls.compact!
          return if urls.size != 2
          urls
        end

        private

        def smart_on_fhir_service?
          service.any? do |service_concept|
            service_concept.coding.any? do |service_coding|
              service_coding.code == 'SMART-on-FHIR'
            end
          end
        end
      end
    end
  end
end
