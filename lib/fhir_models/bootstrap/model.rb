require 'pry-byebug'
require 'nokogiri'
require 'mime/types'
require 'yaml'
require 'bcp47'

module FHIR
  class Model < OpenStruct
    def self.new(*args, &block)
      resource_type = (args.first || {}).delete('resourceType')
      if self == Model && resource_type.nil?
        # raise NotImplementedError, "#{self} is an abstract class and cannot be instantiated."
      end

      subclass = FHIR.const_get(resource_type) if resource_type
      if subclass && subclass != self
        subclass.new(*args, &block)
      else
        super
      end
    rescue
      # TODO: This is probably not what we want. For now, it's good enough. It
      # handles the case where a resourceType got deprecated and removed.
      super
    end

    def initialize(values = {})
      values.each do |attribute, value|
        values[attribute] =
          if value.is_a? Hash
            Model.new(value)
          elsif value.is_a? Array
            value.map do |each_value|
              each_value.is_a?(Hash) ? Model.new(each_value) : each_value
            end
          else
            value
          end
      end
      super
    end

    def self.from_fhir(json, format: :json)
      public_send("from_#{format}", json)
    end

    def self.from_json(json)
      # JSON.parse(json, object_class: Model)
      # { resourceType: 'FHIR::Patient' }
      # JSON.parse(json, create_additions: true, create_id: 'resourceType')
      # binding.pry
      new(JSON.parse(json))
    end

    def to_fhir(format: :json)
      public_send("to_fhir_#{format}")
    end

    def as_json(*args)
      to_h.as_json(*args)
    end

    def to_fhir_json(*args)
      to_h.tap do |json|
        json.merge!(resourceType: resource_type) unless resource_type == 'Model'
      end.to_json(*args)
    end
    alias to_json to_fhir_json

    def resource_type
      self.class.name.split('::').last unless self == Model
    end
    alias resourceType resource_type
  end
end
