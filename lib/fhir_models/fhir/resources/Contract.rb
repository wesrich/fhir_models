module FHIR
  class Contract < FHIR::Model
    MULTIPLE_TYPES = {
      'binding' => ['Attachment', 'Reference']
    }
    SEARCH_PARAMS = ['agent', 'authority', 'domain', 'identifier', 'issued', 'patient', 'signer', 'subject', 'topic', 'ttopic']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Contract.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Contract.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Contract.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Contract.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Contract.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Contract.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Contract.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Contract.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Contract.identifier', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Contract.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'issued' => {'type'=>'dateTime', 'path'=>'Contract.issued', 'min'=>0, 'max'=>1},
      'applies' => {'type'=>'Period', 'path'=>'Contract.applies', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Contract.subject', 'min'=>0, 'max'=>Float::INFINITY},
      'topic' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Contract.topic', 'min'=>0, 'max'=>Float::INFINITY},
      'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Contract.authority', 'min'=>0, 'max'=>Float::INFINITY},
      'domain' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Contract.domain', 'min'=>0, 'max'=>Float::INFINITY},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/contracttypecodes'=>['privacy', 'disclosure', 'healthinsurance', 'supply', 'consent', 'privacy', 'disclosure', 'healthinsurance', 'supply', 'consent']}, 'type'=>'CodeableConcept', 'path'=>'Contract.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-type'}},
      'subType' => {'valid_codes'=>{'http://hl7.org/fhir/contractsubtypecodes'=>['disclosure-ca', 'disclosure-us', 'disclosure-ca', 'disclosure-us']}, 'type'=>'CodeableConcept', 'path'=>'Contract.subType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-subtype'}},
      'action' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractaction'=>['action-a', 'action-b', 'action-a', 'action-b']}, 'type'=>'CodeableConcept', 'path'=>'Contract.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-action'}},
      'actionReason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'CodeableConcept', 'path'=>'Contract.actionReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
      'agent' => {'type'=>'Contract::Agent', 'path'=>'Contract.agent', 'min'=>0, 'max'=>Float::INFINITY},
      'signer' => {'type'=>'Contract::Signer', 'path'=>'Contract.signer', 'min'=>0, 'max'=>Float::INFINITY},
      'valuedItem' => {'type'=>'Contract::ValuedItem', 'path'=>'Contract.valuedItem', 'min'=>0, 'max'=>Float::INFINITY},
      'term' => {'type'=>'Contract::Term', 'path'=>'Contract.term', 'min'=>0, 'max'=>Float::INFINITY},
      'bindingAttachment' => {'type'=>'Attachment', 'path'=>'Contract.binding[x]', 'min'=>0, 'max'=>1},
      'bindingReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Composition', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Contract.binding[x]', 'min'=>0, 'max'=>1},
      'friendly' => {'type'=>'Contract::Friendly', 'path'=>'Contract.friendly', 'min'=>0, 'max'=>Float::INFINITY},
      'legal' => {'type'=>'Contract::Legal', 'path'=>'Contract.legal', 'min'=>0, 'max'=>Float::INFINITY},
      'rule' => {'type'=>'Contract::Rule', 'path'=>'Contract.rule', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Agent < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Agent.actor', 'min'=>1, 'max'=>1},
        'role' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractactorrole'=>['practitioner', 'patient', 'practitioner', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-actorrole'}}
      }
    end

    class Signer < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Signer.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Signer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Signer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractsignertypecodes'=>['AMENDER', 'AUTHN', 'AUT', 'AFFL', 'AGNT', 'ASSIGNED', 'CIT', 'CLAIMANT', 'COAUTH', 'CONSENTER', 'CONSWIT', 'CONT', 'COPART', 'COVPTY', 'DELEGATEE', 'delegator', 'DEPEND', 'DPOWATT', 'EMGCON', 'EVTWIT', 'EXCEST', 'GRANTEE', 'GRANTOR', 'GUAR', 'GUARD', 'GUADLTM', 'INF', 'INTPRT', 'INSBJ', 'HPOWATT', 'HPROV', 'LEGAUTHN', 'NMDINS', 'NOK', 'NOTARY', 'PAT', 'POWATT', 'PRIMAUTH', 'PRIRECIP', 'RECIP', 'RESPRSN', 'REVIEWER', 'TRANS', 'SOURCE', 'SPOWATT', 'VALID', 'VERF', 'WIT', 'AMENDER', 'AUTHN', 'AUT', 'AFFL', 'AGNT', 'ASSIGNED', 'CIT', 'CLAIMANT', 'COAUTH', 'CONSENTER', 'CONSWIT', 'CONT', 'COPART', 'COVPTY', 'DELEGATEE', 'delegator', 'DEPEND', 'DPOWATT', 'EMGCON', 'EVTWIT', 'EXCEST', 'GRANTEE', 'GRANTOR', 'GUAR', 'GUARD', 'GUADLTM', 'INF', 'INTPRT', 'INSBJ', 'HPOWATT', 'HPROV', 'LEGAUTHN', 'NMDINS', 'NOK', 'NOTARY', 'PAT', 'POWATT', 'PRIMAUTH', 'PRIRECIP', 'RECIP', 'RESPRSN', 'REVIEWER', 'TRANS', 'SOURCE', 'SPOWATT', 'VALID', 'VERF', 'WIT']}, 'type'=>'Coding', 'path'=>'Signer.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-signer-type'}},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Signer.party', 'min'=>1, 'max'=>1},
        'signature' => {'type'=>'Signature', 'path'=>'Signer.signature', 'min'=>1, 'max'=>Float::INFINITY}
      }
    end

    class ValuedItem < FHIR::Model
      MULTIPLE_TYPES = {
        'entity' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ValuedItem.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ValuedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ValuedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'entityCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
        'entityReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'ValuedItem.identifier', 'min'=>0, 'max'=>1},
        'effectiveTime' => {'type'=>'dateTime', 'path'=>'ValuedItem.effectiveTime', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'ValuedItem.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Money', 'path'=>'ValuedItem.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'ValuedItem.factor', 'min'=>0, 'max'=>1},
        'points' => {'type'=>'decimal', 'path'=>'ValuedItem.points', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Money', 'path'=>'ValuedItem.net', 'min'=>0, 'max'=>1}
      }
    end

    class Term < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Term.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Term.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Term.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Term.identifier', 'min'=>0, 'max'=>1},
        'issued' => {'type'=>'dateTime', 'path'=>'Term.issued', 'min'=>0, 'max'=>1},
        'applies' => {'type'=>'Period', 'path'=>'Term.applies', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/contracttermtypecodes'=>['oralhealth', 'vision', 'oralhealth', 'vision']}, 'type'=>'CodeableConcept', 'path'=>'Term.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-term-type'}},
        'subType' => {'valid_codes'=>{'http://hl7.org/fhir/contracttermsubtypecodes'=>['oralhealth-basic', 'oralhealth-major', 'oralhealth-orthodontic', 'oralhealth-basic', 'oralhealth-major', 'oralhealth-orthodontic']}, 'type'=>'CodeableConcept', 'path'=>'Term.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-term-subtype'}},
        'topic' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Term.topic', 'min'=>0, 'max'=>Float::INFINITY},
        'action' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractaction'=>['action-a', 'action-b', 'action-a', 'action-b']}, 'type'=>'CodeableConcept', 'path'=>'Term.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-action'}},
        'actionReason' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'MEMADMIN', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'TRAIN', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'REMITADV', 'HRESCH', 'CLINTRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CAREMGT', 'CLINTRL', 'ETREAT', 'POPHLTH']}, 'type'=>'CodeableConcept', 'path'=>'Term.actionReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-PurposeOfUse'}},
        'agent' => {'type'=>'Contract::Term::Agent', 'path'=>'Term.agent', 'min'=>0, 'max'=>Float::INFINITY},
        'text' => {'type'=>'string', 'path'=>'Term.text', 'min'=>0, 'max'=>1},
        'valuedItem' => {'type'=>'Contract::Term::ValuedItem', 'path'=>'Term.valuedItem', 'min'=>0, 'max'=>Float::INFINITY},
        'group' => {'type'=>'Contract::Term', 'path'=>'Term.group', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Agent < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Substance'], 'type'=>'Reference', 'path'=>'Agent.actor', 'min'=>1, 'max'=>1},
          'role' => {'valid_codes'=>{'http://www.hl7.org/fhir/contractactorrole'=>['practitioner', 'patient', 'practitioner', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/contract-actorrole'}}
        }
      end

      class ValuedItem < FHIR::Model
        MULTIPLE_TYPES = {
          'entity' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ValuedItem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ValuedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ValuedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'entityCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
          'entityReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ValuedItem.entity[x]', 'min'=>0, 'max'=>1},
          'identifier' => {'type'=>'Identifier', 'path'=>'ValuedItem.identifier', 'min'=>0, 'max'=>1},
          'effectiveTime' => {'type'=>'dateTime', 'path'=>'ValuedItem.effectiveTime', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'ValuedItem.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'ValuedItem.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'ValuedItem.factor', 'min'=>0, 'max'=>1},
          'points' => {'type'=>'decimal', 'path'=>'ValuedItem.points', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'ValuedItem.net', 'min'=>0, 'max'=>1}
        }
      end
    end

    class Friendly < FHIR::Model
      MULTIPLE_TYPES = {
        'content' => ['Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Friendly.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Friendly.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Friendly.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'contentAttachment' => {'type'=>'Attachment', 'path'=>'Friendly.content[x]', 'min'=>1, 'max'=>1},
        'contentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Composition', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Friendly.content[x]', 'min'=>1, 'max'=>1}
      }
    end

    class Legal < FHIR::Model
      MULTIPLE_TYPES = {
        'content' => ['Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Legal.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Legal.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Legal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'contentAttachment' => {'type'=>'Attachment', 'path'=>'Legal.content[x]', 'min'=>1, 'max'=>1},
        'contentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Composition', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Legal.content[x]', 'min'=>1, 'max'=>1}
      }
    end

    class Rule < FHIR::Model
      MULTIPLE_TYPES = {
        'content' => ['Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'contentAttachment' => {'type'=>'Attachment', 'path'=>'Rule.content[x]', 'min'=>1, 'max'=>1},
        'contentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Rule.content[x]', 'min'=>1, 'max'=>1}
      }
    end
  end
end
