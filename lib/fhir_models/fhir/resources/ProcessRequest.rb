module FHIR
  class ProcessRequest < FHIR::Model
    SEARCH_PARAMS = ['action', 'identifier', 'organization', 'provider']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ProcessRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ProcessRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ProcessRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ProcessRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ProcessRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ProcessRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ProcessRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ProcessRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'ProcessRequest.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'action' => {'valid_codes'=>{'http://hl7.org/fhir/actionlist'=>['cancel', 'poll', 'reprocess', 'status', 'cancel', 'poll', 'reprocess', 'status']}, 'type'=>'code', 'path'=>'ProcessRequest.action', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/actionlist'}},
      'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessRequest.target', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'ProcessRequest.created', 'min'=>0, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'ProcessRequest.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProcessRequest.organization', 'min'=>0, 'max'=>1},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ProcessRequest.request', 'min'=>0, 'max'=>1},
      'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ProcessRequest.response', 'min'=>0, 'max'=>1},
      'nullify' => {'type'=>'boolean', 'path'=>'ProcessRequest.nullify', 'min'=>0, 'max'=>1},
      'reference' => {'type'=>'string', 'path'=>'ProcessRequest.reference', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'ProcessRequest::Item', 'path'=>'ProcessRequest.item', 'min'=>0, 'max'=>Float::INFINITY},
      'include' => {'type'=>'string', 'path'=>'ProcessRequest.include', 'min'=>0, 'max'=>Float::INFINITY},
      'exclude' => {'type'=>'string', 'path'=>'ProcessRequest.exclude', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'ProcessRequest.period', 'min'=>0, 'max'=>1}
    }

    class Item < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceLinkId' => {'type'=>'integer', 'path'=>'Item.sequenceLinkId', 'min'=>1, 'max'=>1}
      }
    end
  end
end
