require 'active_support/concern'

module FHIR
  # Module which delegates a Model's 'read' and other server operations to
  # a given client. Expects to receive a ClientReply or compatible object.
  module Operations
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

    def create(client)
      client.create(self.class, to_hash).resource || self
    end

    def client
      raise 'What are you doing?!'
    end
  end
end
