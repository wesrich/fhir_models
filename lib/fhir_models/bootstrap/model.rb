require 'nokogiri'
require 'mime/types'
require 'yaml'
require 'bcp47'

module FHIR
  class Model < OpenStruct
    def self.new(*args, &block)
      resource_type = (args.first || {}).fetch('resourceType', nil)
      if self == Model && resource_type.nil?
        raise NotImplementedError, "#{self} is an abstract class and cannot be instantiated."
      end

      subclass = FHIR.const_get(resource_type) if resource_type
      if subclass && subclass != self
        subclass.new(*args, &block)
      else
        super
      end
    end

    def to_fhir(format: :json)
      public_send("to_fhir_#{format}")
    end

    def to_fhir_json
      to_h.merge(resourceType: resource_type).to_json
    end

    def resource_type
      self.class.name.split('::').last unless self == Model
    end
    alias resourceType resource_type

    private
  end
end
