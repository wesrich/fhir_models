module FHIR
  class Endpoint < FHIR::Model
    SEARCH_PARAMS = ['connection-type', 'identifier', 'name', 'organization', 'payload-type', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Endpoint.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Endpoint.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Endpoint.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Endpoint.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Endpoint.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Endpoint.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Endpoint.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Endpoint.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Endpoint.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/endpoint-status'=>['active', 'suspended', 'error', 'off', 'entered-in-error', 'test', 'active', 'suspended', 'error', 'off', 'entered-in-error', 'test']}, 'type'=>'code', 'path'=>'Endpoint.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-status'}},
      'name' => {'type'=>'string', 'path'=>'Endpoint.name', 'min'=>0, 'max'=>1},
      'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Endpoint.managingOrganization', 'min'=>0, 'max'=>1},
      'contact' => {'type'=>'ContactPoint', 'path'=>'Endpoint.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'Endpoint.period', 'min'=>0, 'max'=>1},
      'connectionType' => {'valid_codes'=>{'http://hl7.org/fhir/endpoint-connection-type'=>['ihe-xcpd', 'ihe-xca', 'ihe-xdr', 'ihe-xds', 'ihe-iid', 'dicom-wado-rs', 'dicom-qido-rs', 'dicom-stow-rs', 'dicom-wado-uri', 'hl7-fhir-rest', 'hl7-fhir-msg', 'hl7v2-mllp', 'secure-email', 'direct-project', 'ihe-xcpd', 'ihe-xca', 'ihe-xdr', 'ihe-xds', 'ihe-iid', 'dicom-wado-rs', 'dicom-qido-rs', 'dicom-stow-rs', 'dicom-wado-uri', 'hl7-fhir-rest', 'hl7-fhir-msg', 'hl7v2-mllp', 'secure-email', 'direct-project']}, 'type'=>'Coding', 'path'=>'Endpoint.connectionType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-connection-type'}},
      'payloadType' => {'type'=>'CodeableConcept', 'path'=>'Endpoint.payloadType', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-payload-type'}},
      'payloadMimeType' => {'type'=>'code', 'path'=>'Endpoint.payloadMimeType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://www.rfc-editor.org/bcp/bcp13.txt'}},
      'address' => {'type'=>'uri', 'path'=>'Endpoint.address', 'min'=>1, 'max'=>1},
      'header' => {'type'=>'string', 'path'=>'Endpoint.header', 'min'=>0, 'max'=>Float::INFINITY},
      'publicKey' => {'type'=>'string', 'path'=>'Endpoint.publicKey', 'min'=>0, 'max'=>1}
    }
  end
end
