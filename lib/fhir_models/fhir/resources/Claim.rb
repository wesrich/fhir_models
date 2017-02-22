module FHIR
  class Claim < FHIR::Model
    SEARCH_PARAMS = ['created', 'facility', 'identifier', 'insurer', 'organization', 'patient', 'priority', 'provider', 'use']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Claim.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Claim.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Claim.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Claim.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Claim.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Claim.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Claim.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Claim.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Claim.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error', 'active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Claim.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimtype'=>['institutional', 'oral', 'pharmacy', 'professional', 'vision', 'institutional', 'oral', 'pharmacy', 'professional', 'vision']}, 'type'=>'CodeableConcept', 'path'=>'Claim.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-type'}},
      'subType' => {'valid_codes'=>{'http://hl7.org/fhir/ex-claimsubtype'=>['ortho', 'emergency', 'ortho', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'Claim.subType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-subtype'}},
      'use' => {'valid_codes'=>{'http://hl7.org/fhir/claim-use'=>['complete', 'proposed', 'exploratory', 'other', 'complete', 'proposed', 'exploratory', 'other']}, 'type'=>'code', 'path'=>'Claim.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-use'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Claim.patient', 'min'=>0, 'max'=>1},
      'billablePeriod' => {'type'=>'Period', 'path'=>'Claim.billablePeriod', 'min'=>0, 'max'=>1},
      'created' => {'type'=>'dateTime', 'path'=>'Claim.created', 'min'=>0, 'max'=>1},
      'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Claim.enterer', 'min'=>0, 'max'=>1},
      'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.insurer', 'min'=>0, 'max'=>1},
      'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Claim.provider', 'min'=>0, 'max'=>1},
      'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.organization', 'min'=>0, 'max'=>1},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/processpriority'=>['stat', 'normal', 'deferred', 'stat', 'normal', 'deferred']}, 'type'=>'CodeableConcept', 'path'=>'Claim.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
      'fundsReserve' => {'valid_codes'=>{'http://hl7.org/fhir/fundsreserve'=>['patient', 'provider', 'none', 'patient', 'provider', 'none']}, 'type'=>'CodeableConcept', 'path'=>'Claim.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
      'related' => {'type'=>'Claim::Related', 'path'=>'Claim.related', 'min'=>0, 'max'=>Float::INFINITY},
      'prescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Claim.prescription', 'min'=>0, 'max'=>1},
      'originalPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'Claim.originalPrescription', 'min'=>0, 'max'=>1},
      'payee' => {'type'=>'Claim::Payee', 'path'=>'Claim.payee', 'min'=>0, 'max'=>1},
      'referral' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ReferralRequest'], 'type'=>'Reference', 'path'=>'Claim.referral', 'min'=>0, 'max'=>1},
      'facility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Claim.facility', 'min'=>0, 'max'=>1},
      'careTeam' => {'type'=>'Claim::CareTeam', 'path'=>'Claim.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
      'information' => {'type'=>'Claim::Information', 'path'=>'Claim.information', 'min'=>0, 'max'=>Float::INFINITY},
      'diagnosis' => {'type'=>'Claim::Diagnosis', 'path'=>'Claim.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
      'procedure' => {'type'=>'Claim::Procedure', 'path'=>'Claim.procedure', 'min'=>0, 'max'=>Float::INFINITY},
      'insurance' => {'type'=>'Claim::Insurance', 'path'=>'Claim.insurance', 'min'=>0, 'max'=>Float::INFINITY},
      'accident' => {'type'=>'Claim::Accident', 'path'=>'Claim.accident', 'min'=>0, 'max'=>1},
      'employmentImpacted' => {'type'=>'Period', 'path'=>'Claim.employmentImpacted', 'min'=>0, 'max'=>1},
      'hospitalization' => {'type'=>'Period', 'path'=>'Claim.hospitalization', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'Claim::Item', 'path'=>'Claim.item', 'min'=>0, 'max'=>Float::INFINITY},
      'total' => {'type'=>'Money', 'path'=>'Claim.total', 'min'=>0, 'max'=>1}
    }

    class Related < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'claim' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'Related.claim', 'min'=>0, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/ex-relatedclaimrelationship'=>['prior', 'associated', 'prior', 'associated']}, 'type'=>'CodeableConcept', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/related-claim-relationship'}},
        'reference' => {'type'=>'Identifier', 'path'=>'Related.reference', 'min'=>0, 'max'=>1}
      }
    end

    class Payee < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Payee.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Payee.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Payee.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/payeetype'=>['subscriber', 'provider', 'other', 'subscriber', 'provider', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Payee.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
        'resourceType' => {'local_name'=>'local_resourceType', 'valid_codes'=>{'http://hl7.org/fhir/ex-payee-resource-type'=>['organization', 'patient', 'practitioner', 'relatedperson', 'organization', 'patient', 'practitioner', 'relatedperson']}, 'type'=>'Coding', 'path'=>'Payee.resourceType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-payee-resource-type'}},
        'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Payee.party', 'min'=>0, 'max'=>1}
      }
    end

    class CareTeam < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CareTeam.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CareTeam.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'CareTeam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'CareTeam.sequence', 'min'=>1, 'max'=>1},
        'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CareTeam.provider', 'min'=>1, 'max'=>1},
        'responsible' => {'type'=>'boolean', 'path'=>'CareTeam.responsible', 'min'=>0, 'max'=>1},
        'role' => {'valid_codes'=>{'http://hl7.org/fhir/claimcareteamrole'=>['primary', 'assist', 'supervisor', 'other', 'primary', 'assist', 'supervisor', 'other']}, 'type'=>'CodeableConcept', 'path'=>'CareTeam.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-careteamrole'}},
        'qualification' => {'valid_codes'=>{'http://hl7.org/fhir/ex-providerqualification'=>['311405', '604215', '604210', '311405', '604215', '604210']}, 'type'=>'CodeableConcept', 'path'=>'CareTeam.qualification', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/provider-qualification'}}
      }
    end

    class Information < FHIR::Model
      MULTIPLE_TYPES = {
        'timing' => ['date', 'Period'],
        'value' => ['string', 'Quantity', 'Attachment', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Information.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Information.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Information.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/claiminformationcategory'=>['info', 'discharge', 'onset', 'related', 'exception', 'material', 'attachment', 'missingtooth', 'other', 'info', 'discharge', 'onset', 'related', 'exception', 'material', 'attachment', 'missingtooth', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Information.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-informationcategory'}},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/claim-exception'=>['student', 'disabled', 'student', 'disabled']}, 'type'=>'CodeableConcept', 'path'=>'Information.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-exception'}},
        'timingDate' => {'type'=>'date', 'path'=>'Information.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'Information.timing[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1},
        'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Information.value[x]', 'min'=>0, 'max'=>1},
        'reason' => {'valid_codes'=>{'http://hl7.org/fhir/missingtoothreason'=>['e', 'c', 'u', 'o', 'e', 'c', 'u', 'o']}, 'type'=>'CodeableConcept', 'path'=>'Information.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/missing-tooth-reason'}}
      }
    end

    class Diagnosis < FHIR::Model
      MULTIPLE_TYPES = {
        'diagnosis' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>1, 'max'=>1},
        'diagnosisCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10'}},
        'diagnosisReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/ex-diagnosistype'=>['admitting', 'clinical', 'differential', 'discharge', 'laboratory', 'nursing', 'prenatal', 'principal', 'radiology', 'remote', 'retrospective', 'self', 'admitting', 'clinical', 'differential', 'discharge', 'laboratory', 'nursing', 'prenatal', 'principal', 'radiology', 'remote', 'retrospective', 'self']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosistype'}},
        'packageCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-diagnosisrelatedgroup'=>['100', '101', '300', '100', '101', '300']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.packageCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosisrelatedgroup'}}
      }
    end

    class Procedure < FHIR::Model
      MULTIPLE_TYPES = {
        'procedure' => ['CodeableConcept', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>1, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Procedure.date', 'min'=>0, 'max'=>1},
        'procedureCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/sid/ex-icd-10-procedures'=>['123001', '123002', '123003', '123001', '123002', '123003']}, 'type'=>'CodeableConcept', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10-procedures'}},
        'procedureReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1}
      }
    end

    class Insurance < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Insurance.sequence', 'min'=>1, 'max'=>1},
        'focal' => {'type'=>'boolean', 'path'=>'Insurance.focal', 'min'=>1, 'max'=>1},
        'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
        'businessArrangement' => {'type'=>'string', 'path'=>'Insurance.businessArrangement', 'min'=>0, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'Insurance.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
        'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Insurance.claimResponse', 'min'=>0, 'max'=>1}
      }
    end

    class Accident < FHIR::Model
      MULTIPLE_TYPES = {
        'location' => ['Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Accident.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Accident.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Accident.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'date', 'path'=>'Accident.date', 'min'=>1, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/ActCode'=>['MVA', 'SCHOOL', 'SPT', 'WPA']}, 'type'=>'CodeableConcept', 'path'=>'Accident.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ActIncidentCode'}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1}
      }
    end

    class Item < FHIR::Model
      MULTIPLE_TYPES = {
        'serviced' => ['date', 'Period'],
        'location' => ['CodeableConcept', 'Address', 'Reference']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequence' => {'type'=>'positiveInt', 'path'=>'Item.sequence', 'min'=>1, 'max'=>1},
        'careTeamLinkId' => {'type'=>'positiveInt', 'path'=>'Item.careTeamLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosisLinkId' => {'type'=>'positiveInt', 'path'=>'Item.diagnosisLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'procedureLinkId' => {'type'=>'positiveInt', 'path'=>'Item.procedureLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'informationLinkId' => {'type'=>'positiveInt', 'path'=>'Item.informationLinkId', 'min'=>0, 'max'=>Float::INFINITY},
        'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'CodeableConcept', 'path'=>'Item.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'Item.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
        'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Item.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
        'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
        'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'CodeableConcept', 'path'=>'Item.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
        'servicedDate' => {'type'=>'date', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
        'locationCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/ex-serviceplace'=>['01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41', '01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41']}, 'type'=>'CodeableConcept', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-place'}},
        'locationAddress' => {'type'=>'Address', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>0, 'max'=>1},
        'unitPrice' => {'type'=>'Money', 'path'=>'Item.unitPrice', 'min'=>0, 'max'=>1},
        'factor' => {'type'=>'decimal', 'path'=>'Item.factor', 'min'=>0, 'max'=>1},
        'net' => {'type'=>'Money', 'path'=>'Item.net', 'min'=>0, 'max'=>1},
        'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Item.udi', 'min'=>0, 'max'=>Float::INFINITY},
        'bodySite' => {'valid_codes'=>{'http://hl7.org/fhir/ex-tooth'=>['0', '1', '2', '3', '4', '5', '6', '7', '8', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48', '0', '1', '2', '3', '4', '5', '6', '7', '8', '11', '12', '13', '14', '15', '16', '17', '18', '21', '22', '23', '24', '25', '26', '27', '28', '31', '32', '33', '34', '35', '36', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48']}, 'type'=>'CodeableConcept', 'path'=>'Item.bodySite', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/tooth'}},
        'subSite' => {'valid_codes'=>{'http://hl7.org/fhir/FDI-surface'=>['M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD', 'M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD']}, 'type'=>'CodeableConcept', 'path'=>'Item.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/surface'}},
        'detail' => {'type'=>'Claim::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY},
        'prosthesis' => {'type'=>'Claim::Item::Prosthesis', 'path'=>'Item.prosthesis', 'min'=>0, 'max'=>1}
      }

      class Detail < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Detail.sequence', 'min'=>1, 'max'=>1},
          'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'CodeableConcept', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
          'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Detail.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
          'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'CodeableConcept', 'path'=>'Detail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.udi', 'min'=>0, 'max'=>Float::INFINITY},
          'subDetail' => {'type'=>'Claim::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SubDetail < FHIR::Model
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.sequence', 'min'=>1, 'max'=>1},
            'revenue' => {'valid_codes'=>{'http://hl7.org/fhir/ex-revenue-center'=>['0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452', '0370', '0420', '0421', '0440', '0441', '0450', '0451', '0452']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
            'category' => {'valid_codes'=>{'http://hl7.org/fhir/benefit-subcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6', '1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-subcategory'}},
            'service' => {'valid_codes'=>{'http://hl7.org/fhir/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555', '1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.service', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/modifiers'=>['a', 'b', 'c', 'e', 'x', 'a', 'b', 'c', 'e', 'x']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
            'programCode' => {'valid_codes'=>{'http://hl7.org/fhir/ex-programcode'=>['as', 'hd', 'auscr', 'as', 'hd', 'auscr']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
            'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
            'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SubDetail.udi', 'min'=>0, 'max'=>Float::INFINITY}
          }
        end
      end

      class Prosthesis < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Prosthesis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Prosthesis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Prosthesis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'initial' => {'type'=>'boolean', 'path'=>'Prosthesis.initial', 'min'=>0, 'max'=>1},
          'priorDate' => {'type'=>'date', 'path'=>'Prosthesis.priorDate', 'min'=>0, 'max'=>1},
          'priorMaterial' => {'valid_codes'=>{'http://hl7.org/fhir/ex-oralprostho'=>['1', '2', '3', '4', '1', '2', '3', '4']}, 'type'=>'CodeableConcept', 'path'=>'Prosthesis.priorMaterial', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/oral-prosthodontic-material'}}
        }
      end
    end
  end
end
