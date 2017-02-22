module FHIR
  module Json
    def self.from_json(contents)
      FHIR::Model.from_json(contents)
    end
  end
end
