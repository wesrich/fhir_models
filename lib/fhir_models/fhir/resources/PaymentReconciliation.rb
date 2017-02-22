module FHIR
  class PaymentReconciliation < FHIR::Model
    SEARCH_PARAMS = ['created', 'disposition', 'identifier', 'organization', 'outcome', 'request', 'request-organization', 'request-provider']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'PaymentReconciliation.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'PaymentReconciliation.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'PaymentReconciliation.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'PaymentReconciliation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'PaymentReconciliation.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'PaymentReconciliation.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'PaymentReconciliation.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'period' => {'type'=>'Period', 'path'=>'PaymentReconciliation.period', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'PaymentReconciliation.created', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.organization', 'min'=>0, 'max'=>1},
      'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ProcessRequest'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.request', 'min'=>0, 'max'=>1},
      'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/remittance-outcome'=>['complete', 'error', 'partial', 'complete', 'error', 'partial']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/remittance-outcome'}},
      'disposition' => {'type'=>'string', 'path'=>'PaymentReconciliation.disposition', 'min'=>0, 'max'=>1},
      'requestProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestProvider', 'min'=>0, 'max'=>1},
      'requestOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestOrganization', 'min'=>0, 'max'=>1},
      'detail' => {'type'=>'PaymentReconciliation::Detail', 'path'=>'PaymentReconciliation.detail', 'min'=>0, 'max'=>Float::INFINITY},
      'form' => {'valid_codes'=>{'http://hl7.org/fhir/forms-codes'=>['1', '2', '1', '2']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
      'total' => {'type'=>'Money', 'path'=>'PaymentReconciliation.total', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'PaymentReconciliation::Note', 'path'=>'PaymentReconciliation.note', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Detail < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/payment-type'=>['payment', 'adjustment', 'advance', 'payment', 'adjustment', 'advance']}, 'type'=>'CodeableConcept', 'path'=>'Detail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-type'}},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.request', 'min'=>0, 'max'=>1},
        'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Detail.response', 'min'=>0, 'max'=>1},
        'submitter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.submitter', 'min'=>0, 'max'=>1},
        'payee' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Detail.payee', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'date', 'path'=>'Detail.date', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'Detail.amount', 'min'=>0, 'max'=>1}
      }
    end

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
