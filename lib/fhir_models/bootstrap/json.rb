module FHIR
  module Json
    #
    #  This module includes methods to serialize or deserialize FHIR resources to and from JSON.
    #

    def to_json
      hash = self.to_hash
      JSON.pretty_unparse(hash)
    end

    def self.from_json(json)
      hash = JSON.parse(json)
      resource = nil
      begin
        resource_type = hash['resourceType']
        klass = Module.const_get("FHIR::#{resource_type}")
        resource = klass.new(hash)
      rescue => e
        FHIR.logger.error("Failed to deserialize JSON:\n#{json}\n#{e.backtrace}")
        resource = nil
      end
      resource
    end
  end
end
