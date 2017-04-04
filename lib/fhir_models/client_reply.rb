module FHIR
  # ClientReply containing the response with status code and the logic to
  # parse response body into a FHIR model resource.
  class ClientReply
    attr_accessor :response, :resource_type
    attr_reader :client
    delegate :body, :code, :request, to: :response

    def initialize(response:, resource_type: nil, client: nil)
      @response = response
      @resource_type = resource_type
      @client = client
    end

    def resource
      return if body.empty?
      @resource ||= FHIR.from_contents(body).tap do |resource|
        resource.client = client
      end
    end

    def success?
      (200..299).cover? code
    end
  end
end
