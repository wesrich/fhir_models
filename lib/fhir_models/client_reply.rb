module FHIR
  # ClientReply containing the response with status code and the logic to
  # parse response body into a FHIR model resource.
  class ClientReply
    attr_accessor :response, :resource_type
    delegate :body, :code, :request, to: :response

    def initialize(response:, resource_type: nil)
      @response = response
      @resource_type = resource_type
    end

    def resource
      @resource ||= FHIR.from_contents(body) unless body.empty?
    end

    def success?
      (200..299).cover? code
    end
  end
end
