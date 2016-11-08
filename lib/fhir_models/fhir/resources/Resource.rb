module FHIR
  class Resource < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ["_id", "_lastUpdated", "_profile", "_security", "_tag"]
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Resource.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Resource.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'type'=>'code', 'path'=>'Resource.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}}
    }

    attr_accessor :id            # 0-1 id
    attr_accessor :meta          # 0-1 Meta
    attr_accessor :implicitRules # 0-1 uri
    attr_accessor :language      # 0-1 code

    def resourceType
      'Resource'
    end
  end
end