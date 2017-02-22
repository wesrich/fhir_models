module FHIR
  class ImmunizationRecommendation < FHIR::Model
    SEARCH_PARAMS = ['date', 'dose-number', 'dose-sequence', 'identifier', 'information', 'patient', 'status', 'support', 'vaccine-type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ImmunizationRecommendation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ImmunizationRecommendation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ImmunizationRecommendation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ImmunizationRecommendation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ImmunizationRecommendation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ImmunizationRecommendation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ImmunizationRecommendation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImmunizationRecommendation.patient', 'min'=>1, 'max'=>1},
      'recommendation' => {'type'=>'ImmunizationRecommendation::Recommendation', 'path'=>'ImmunizationRecommendation.recommendation', 'min'=>1, 'max'=>Float::INFINITY}
    }

    class Recommendation < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Recommendation.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Recommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Recommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'dateTime', 'path'=>'Recommendation.date', 'min'=>1, 'max'=>1},
        'vaccineCode' => {'type'=>'CodeableConcept', 'path'=>'Recommendation.vaccineCode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
        'doseNumber' => {'type'=>'positiveInt', 'path'=>'Recommendation.doseNumber', 'min'=>0, 'max'=>1},
        'forecastStatus' => {'valid_codes'=>{'http://hl7.org/fhir/immunization-recommendation-status'=>['due', 'overdue', 'due', 'overdue']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.forecastStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-status'}},
        'dateCriterion' => {'type'=>'ImmunizationRecommendation::Recommendation::DateCriterion', 'path'=>'Recommendation.dateCriterion', 'min'=>0, 'max'=>Float::INFINITY},
        'protocol' => {'type'=>'ImmunizationRecommendation::Recommendation::Protocol', 'path'=>'Recommendation.protocol', 'min'=>0, 'max'=>1},
        'supportingImmunization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization'], 'type'=>'Reference', 'path'=>'Recommendation.supportingImmunization', 'min'=>0, 'max'=>Float::INFINITY},
        'supportingPatientInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/AllergyIntolerance'], 'type'=>'Reference', 'path'=>'Recommendation.supportingPatientInformation', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class DateCriterion < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'DateCriterion.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DateCriterion.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'DateCriterion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/immunization-recommendation-date-criterion'=>['due', 'recommended', 'earliest', 'overdue', 'latest', 'due', 'recommended', 'earliest', 'overdue', 'latest']}, 'type'=>'CodeableConcept', 'path'=>'DateCriterion.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-date-criterion'}},
          'value' => {'type'=>'dateTime', 'path'=>'DateCriterion.value', 'min'=>1, 'max'=>1}
        }
      end

      class Protocol < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Protocol.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Protocol.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Protocol.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'doseSequence' => {'type'=>'positiveInt', 'path'=>'Protocol.doseSequence', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Protocol.description', 'min'=>0, 'max'=>1},
          'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Protocol.authority', 'min'=>0, 'max'=>1},
          'series' => {'type'=>'string', 'path'=>'Protocol.series', 'min'=>0, 'max'=>1}
        }
      end
    end
  end
end
