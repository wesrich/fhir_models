require 'active_support/concern'

module FHIR
  # Module which delegates a Model's 'read' and other server operations to
  # a given client. Expects to receive a ClientReply or compatible object.
  module Operations
    class MissingClientError < StandardError; end

    attr_reader :client

    extend ::ActiveSupport::Concern

    class_methods do
      def read(id, client)
        client.read(self, id).resource
      end

      def search(params, client)
        client.search(self, params).resource
      end

      def create(resource, client)
        resource = new(resource) unless resource.is_a?(self)
        resource.create(client)
      end
    end

    def create(client = self.client)
      raise MissingClientError, 'Cannot create resource without a client' unless client.present?
      client.create(self.class, to_hash).resource || self
    end

    def client=(new_client)
      @client = new_client

      self.class::METADATA.each do |name, metadata|
        attribute = metadata['local_name'] || name
        value = public_send(attribute)
        assign_client_on_child(value)
      end
    end

    private

    def assign_client_on_child(child)
      if child.is_a?(FHIR::Model)
        child.client = client
      elsif child.is_a?(Array)
        child.each { |item| assign_client_on_child(item) }
      end
    end
  end
end
