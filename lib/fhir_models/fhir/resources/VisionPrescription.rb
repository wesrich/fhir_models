module FHIR
  class VisionPrescription < FHIR::Model
    MULTIPLE_TYPES = {
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['identifier', 'patient', 'encounter', 'datewritten', 'prescriber']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'VisionPrescription.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'VisionPrescription.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'VisionPrescription.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'VisionPrescription.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'VisionPrescription.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'VisionPrescription.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'VisionPrescription.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'VisionPrescription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'VisionPrescription.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'VisionPrescription.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'VisionPrescription.patient', 'min'=>0, 'max'=>1},
      'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'VisionPrescription.encounter', 'min'=>0, 'max'=>1},
      'dateWritten' => {'type'=>'dateTime', 'path'=>'VisionPrescription.dateWritten', 'min'=>0, 'max'=>1},
      'prescriber' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'VisionPrescription.prescriber', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'VisionPrescription.reason[x]', 'min'=>0, 'max'=>1},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'VisionPrescription.reason[x]', 'min'=>0, 'max'=>1},
      'dispense' => {'type'=>'VisionPrescription::Dispense', 'path'=>'VisionPrescription.dispense', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Dispense < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Dispense.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Dispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Dispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'product' => {'valid_codes'=>{'http://hl7.org/fhir/ex-visionprescriptionproduct'=>['lens', 'contact', 'lens', 'contact']}, 'type'=>'CodeableConcept', 'path'=>'Dispense.product', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-product'}},
        'eye' => {'valid_codes'=>{'http://hl7.org/fhir/vision-eye-codes'=>['right', 'left', 'right', 'left']}, 'type'=>'CodeableConcept', 'path'=>'Dispense.eye', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-eye-codes'}},
        'sphere' => {'type'=>'decimal', 'path'=>'Dispense.sphere', 'min'=>0, 'max'=>1},
        'cylinder' => {'type'=>'decimal', 'path'=>'Dispense.cylinder', 'min'=>0, 'max'=>1},
        'axis' => {'type'=>'integer', 'path'=>'Dispense.axis', 'min'=>0, 'max'=>1},
        'prism' => {'type'=>'decimal', 'path'=>'Dispense.prism', 'min'=>0, 'max'=>1},
        'base' => {'valid_codes'=>{'http://hl7.org/fhir/vision-base-codes'=>['up', 'down', 'in', 'out', 'up', 'down', 'in', 'out']}, 'type'=>'CodeableConcept', 'path'=>'Dispense.base', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/vision-base-codes'}},
        'add' => {'type'=>'decimal', 'path'=>'Dispense.add', 'min'=>0, 'max'=>1},
        'power' => {'type'=>'decimal', 'path'=>'Dispense.power', 'min'=>0, 'max'=>1},
        'backCurve' => {'type'=>'decimal', 'path'=>'Dispense.backCurve', 'min'=>0, 'max'=>1},
        'diameter' => {'type'=>'decimal', 'path'=>'Dispense.diameter', 'min'=>0, 'max'=>1},
        'duration' => {'type'=>'Quantity', 'path'=>'Dispense.duration', 'min'=>0, 'max'=>1},
        'color' => {'type'=>'string', 'path'=>'Dispense.color', 'min'=>0, 'max'=>1},
        'brand' => {'type'=>'string', 'path'=>'Dispense.brand', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'string', 'path'=>'Dispense.note', 'min'=>0, 'max'=>1}
      }
    end
  end
end
