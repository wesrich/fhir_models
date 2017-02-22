module FHIR
  class Coverage < FHIR::Model
    SEARCH_PARAMS = ['beneficiary', 'class', 'dependent', 'group', 'identifier', 'payor', 'plan', 'policyholder', 'sequence', 'subclass', 'subgroup', 'subplan', 'subscriber', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Coverage.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Coverage.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Coverage.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Coverage.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Coverage.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Coverage.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Coverage.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'Coverage.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-type'}},
      'policyHolder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.policyHolder', 'min'=>0, 'max'=>1},
      'subscriber' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Coverage.subscriber', 'min'=>0, 'max'=>1},
      'subscriberId' => {'type'=>'string', 'path'=>'Coverage.subscriberId', 'min'=>0, 'max'=>1},
      'beneficiary' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Coverage.beneficiary', 'min'=>0, 'max'=>1},
      'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/policyholder-relationship'=>['child', 'parent', 'spouse', 'common', 'other', 'self', 'child', 'parent', 'spouse', 'common', 'other', 'self']}, 'type'=>'CodeableConcept', 'path'=>'Coverage.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/policyholder-relationship'}},
      'period' => {'type'=>'Period', 'path'=>'Coverage.period', 'min'=>0, 'max'=>1},
      'payor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Coverage.payor', 'min'=>0, 'max'=>Float::INFINITY},
      'group' => {'type'=>'Coverage::Group', 'path'=>'Coverage.group', 'min'=>0, 'max'=>1},
      'dependent' => {'type'=>'string', 'path'=>'Coverage.dependent', 'min'=>0, 'max'=>1},
      'sequence' => {'type'=>'string', 'path'=>'Coverage.sequence', 'min'=>0, 'max'=>1},
      'order' => {'type'=>'positiveInt', 'path'=>'Coverage.order', 'min'=>0, 'max'=>1},
      'network' => {'type'=>'string', 'path'=>'Coverage.network', 'min'=>0, 'max'=>1},
      'contract' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'Coverage.contract', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Group < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'group' => {'type'=>'string', 'path'=>'Group.group', 'min'=>0, 'max'=>1},
        'groupDisplay' => {'type'=>'string', 'path'=>'Group.groupDisplay', 'min'=>0, 'max'=>1},
        'subGroup' => {'type'=>'string', 'path'=>'Group.subGroup', 'min'=>0, 'max'=>1},
        'subGroupDisplay' => {'type'=>'string', 'path'=>'Group.subGroupDisplay', 'min'=>0, 'max'=>1},
        'plan' => {'type'=>'string', 'path'=>'Group.plan', 'min'=>0, 'max'=>1},
        'planDisplay' => {'type'=>'string', 'path'=>'Group.planDisplay', 'min'=>0, 'max'=>1},
        'subPlan' => {'type'=>'string', 'path'=>'Group.subPlan', 'min'=>0, 'max'=>1},
        'subPlanDisplay' => {'type'=>'string', 'path'=>'Group.subPlanDisplay', 'min'=>0, 'max'=>1},
        'class' => {'local_name'=>'local_class', 'type'=>'string', 'path'=>'Group.class', 'min'=>0, 'max'=>1},
        'classDisplay' => {'type'=>'string', 'path'=>'Group.classDisplay', 'min'=>0, 'max'=>1},
        'subClass' => {'type'=>'string', 'path'=>'Group.subClass', 'min'=>0, 'max'=>1},
        'subClassDisplay' => {'type'=>'string', 'path'=>'Group.subClassDisplay', 'min'=>0, 'max'=>1}
      }
    end
  end
end
