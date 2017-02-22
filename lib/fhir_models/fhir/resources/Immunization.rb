module FHIR
  class Immunization < FHIR::Model
    SEARCH_PARAMS = ['date', 'identifier', 'patient', 'dose-sequence', 'location', 'lot-number', 'manufacturer', 'notgiven', 'performer', 'reaction', 'reaction-date', 'reason', 'reason-not-given', 'requester', 'status', 'vaccine-code']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Immunization.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Immunization.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Immunization.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Immunization.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Immunization.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Immunization.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Immunization.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Immunization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Immunization.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/medication-admin-status'=>['completed', 'entered-in-error', 'in-progress', 'on-hold', 'completed', 'entered-in-error', 'stopped']}, 'type'=>'code', 'path'=>'Immunization.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-status'}},
      'date' => {'type'=>'dateTime', 'path'=>'Immunization.date', 'min'=>0, 'max'=>1},
      'vaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Immunization.vaccineCode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Immunization.patient', 'min'=>1, 'max'=>1},
      'wasNotGiven' => {'type'=>'boolean', 'path'=>'Immunization.wasNotGiven', 'min'=>1, 'max'=>1},
      'primarySource' => {'type'=>'boolean', 'path'=>'Immunization.primarySource', 'min'=>1, 'max'=>1},
      'reportOrigin' => {'type'=>'CodeableConcept', 'path'=>'Immunization.reportOrigin', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-origin'}},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Immunization.performer', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Immunization.requester', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Immunization.encounter', 'min'=>0, 'max'=>1},
      'manufacturer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Immunization.manufacturer', 'min'=>0, 'max'=>1},
      'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Immunization.location', 'min'=>0, 'max'=>1},
      'lotNumber' => {'type'=>'string', 'path'=>'Immunization.lotNumber', 'min'=>0, 'max'=>1},
      'expirationDate' => {'type'=>'date', 'path'=>'Immunization.expirationDate', 'min'=>0, 'max'=>1},
      'site' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActSite'=>['LA', 'RA']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-site'}},
      'route' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RouteOfAdministration'=>['IM', 'PO', 'NASINHL']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-route'}},
      'doseQuantity' => {'type'=>'Quantity', 'path'=>'Immunization.doseQuantity', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'Immunization.note', 'min'=>0, 'max'=>Float::INFINITY},
      'explanation' => {'type'=>'Immunization::Explanation', 'path'=>'Immunization.explanation', 'min'=>0, 'max'=>1},
      'reaction' => {'type'=>'Immunization::Reaction', 'path'=>'Immunization.reaction', 'min'=>0, 'max'=>Float::INFINITY},
      'vaccinationProtocol' => {'type'=>'Immunization::VaccinationProtocol', 'path'=>'Immunization.vaccinationProtocol', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Explanation < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Explanation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Explanation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Explanation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'valid_codes'=>{'http://snomed.info/sct'=>['429060002', '281657000']}, 'type'=>'CodeableConcept', 'path'=>'Explanation.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-reason'}},
        'reasonNotGiven' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['IMMUNE', 'MEDPREC', 'OSTOCK', 'PATOBJ'], 'http://snomed.info/sct'=>['171257003', '171265000', '171266004', '171267008', '171268003', '171269006', '171270007', '171271006', '171272004', '171280006', '171283008', '171285001', '171286000', '171291004', '171292006', '171293001', '268559007', '310839003', '310840001', '314768003', '314769006', '314936001', '407598009']}, 'type'=>'CodeableConcept', 'path'=>'Explanation.reasonNotGiven', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/no-immunization-reason'}}
      }
    end

    class Reaction < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Reaction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Reaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Reaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'dateTime', 'path'=>'Reaction.date', 'min'=>0, 'max'=>1},
        'detail' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Reaction.detail', 'min'=>0, 'max'=>1},
        'reported' => {'type'=>'boolean', 'path'=>'Reaction.reported', 'min'=>0, 'max'=>1}
      }
    end

    class VaccinationProtocol < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'VaccinationProtocol.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'VaccinationProtocol.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'VaccinationProtocol.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'doseSequence' => {'type'=>'positiveInt', 'path'=>'VaccinationProtocol.doseSequence', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'VaccinationProtocol.description', 'min'=>0, 'max'=>1},
        'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'VaccinationProtocol.authority', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'string', 'path'=>'VaccinationProtocol.series', 'min'=>0, 'max'=>1},
        'seriesDoses' => {'type'=>'positiveInt', 'path'=>'VaccinationProtocol.seriesDoses', 'min'=>0, 'max'=>1},
        'targetDisease' => {'valid_codes'=>{'http://snomed.info/sct'=>['1857005', '397430003', '14189004', '36989005', '36653000', '76902006', '709410003', '27836007', '398102009']}, 'type'=>'CodeableConcept', 'path'=>'VaccinationProtocol.targetDisease', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-target'}},
        'doseStatus' => {'valid_codes'=>{'http://hl7.org/fhir/vaccination-protocol-dose-status'=>['count', 'nocount', 'count', 'nocount']}, 'type'=>'CodeableConcept', 'path'=>'VaccinationProtocol.doseStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-status'}},
        'doseStatusReason' => {'valid_codes'=>{'http://hl7.org/fhir/vaccination-protocol-dose-status-reason'=>['advstorage', 'coldchbrk', 'explot', 'outsidesched', 'prodrecall', 'advstorage', 'coldchbrk', 'explot', 'outsidesched', 'prodrecall']}, 'type'=>'CodeableConcept', 'path'=>'VaccinationProtocol.doseStatusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccination-protocol-dose-status-reason'}}
      }
    end
  end
end
