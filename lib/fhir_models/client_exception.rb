module FHIR
  # ClientException acts like a ClientReply, but is intended to receive an
  # ExceptionWithResponse object from the http_client.
  class ClientException < ClientReply
    attr_accessor :exception_with_response
    delegate :response, to: :exception_with_response

    def initialize(response:)
      @exception_with_response = response
    end
  end
end
