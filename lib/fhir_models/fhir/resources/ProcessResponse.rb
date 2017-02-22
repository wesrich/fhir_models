module FHIR
  class ProcessResponse < FHIR::Model
    SEARCH_PARAMS = ['identifier', 'organization', 'request', 'request-organization', 'request-provider']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ProcessResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ProcessResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ProcessResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ProcessResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ProcessResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ProcessResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ProcessResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ProcessResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'ProcessResponse.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'created' => {'type'=>'dateTime', 'path'=>'ProcessResponse.created', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessResponse.organization', 'min'=>0, 'max'=>1},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ProcessResponse.request', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/processoutcomecodes'=>['complete', 'pended', 'error', 'complete', 'pended', 'error']}, 'type'=>'CodeableConcept', 'path'=>'ProcessResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'ProcessResponse.disposition', 'min'=>0, 'max'=>1},
      'requestProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'ProcessResponse.requestProvider', 'min'=>0, 'max'=>1},
      'requestOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessResponse.requestOrganization', 'min'=>0, 'max'=>1},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2', '1', '2']}, 'type'=>'CodeableConcept', 'path'=>'ProcessResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'note' => {'type'=>'ProcessResponse::Note', 'path'=>'ProcessResponse.note', 'min'=>0, 'max'=>Float::INFINITY},
      'error' => {'valid_codes'=>{'http://hl7.org/fhir/adjudication-error'=>['a001', 'a002', 'a001', 'a002']}, 'type'=>'CodeableConcept', 'path'=>'ProcessResponse.error', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}},
      'communicationRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CommunicationRequest'], 'type'=>'Reference', 'path'=>'ProcessResponse.communicationRequest', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Note < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Note.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Note.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Note.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper', 'display', 'print', 'printoper']}, 'type'=>'CodeableConcept', 'path'=>'Note.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
        'text' => {'type'=>'string', 'path'=>'Note.text', 'min'=>0, 'max'=>1}
      }
    end
  end
end
