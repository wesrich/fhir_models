module FHIR
  class GuidanceResponse < FHIR::Model
    MULTIPLE_TYPES = {
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['patient', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'GuidanceResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'GuidanceResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'GuidanceResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'GuidanceResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'GuidanceResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'GuidanceResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'GuidanceResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'requestId' => {'type'=>'id', 'path'=>'GuidanceResponse.requestId', 'min'=>0, 'max'=>1},
      'identifier' => {'type'=>'Identifier', 'path'=>'GuidanceResponse.identifier', 'min'=>0, 'max'=>1},
      'module' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceDefinition'], 'type'=>'Reference', 'path'=>'GuidanceResponse.module', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/guidance-response-status'=>['success', 'data-requested', 'data-required', 'in-progress', 'failure', 'success', 'data-requested', 'data-required', 'in-progress', 'failure']}, 'type'=>'code', 'path'=>'GuidanceResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/guidance-response-status'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'GuidanceResponse.subject', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'GuidanceResponse.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'GuidanceResponse.occurrenceDateTime', 'min'=>0, 'max'=>1},
      'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'GuidanceResponse.performer', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'GuidanceResponse.reason[x]', 'min'=>0, 'max'=>1},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'GuidanceResponse.reason[x]', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'GuidanceResponse.note', 'min'=>0, 'max'=>Float::INFINITY},
      'evaluationMessage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/OperationOutcome'], 'type'=>'Reference', 'path'=>'GuidanceResponse.evaluationMessage', 'min'=>0, 'max'=>Float::INFINITY},
      'outputParameters' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Parameters'], 'type'=>'Reference', 'path'=>'GuidanceResponse.outputParameters', 'min'=>0, 'max'=>1},
      'result' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/RequestGroup'], 'type'=>'Reference', 'path'=>'GuidanceResponse.result', 'min'=>0, 'max'=>1},
      'dataRequirement' => {'type'=>'DataRequirement', 'path'=>'GuidanceResponse.dataRequirement', 'min'=>0, 'max'=>Float::INFINITY}
    }
  end
end
