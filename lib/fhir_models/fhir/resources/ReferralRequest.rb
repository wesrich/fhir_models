module FHIR
  class ReferralRequest < FHIR::Model
    include FHIR::Hashable
    include FHIR::Json
    include FHIR::Xml

    SEARCH_PARAMS = ['date', 'patient', 'type', 'basedon', 'category', 'context', 'parent', 'priority', 'recipient', 'requester', 'specialty', 'status']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'ReferralRequest.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'ReferralRequest.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'ReferralRequest.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'ReferralRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'ReferralRequest.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'ReferralRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'ReferralRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'ReferralRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'ReferralRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ReferralRequest', 'http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/DiagnosticRequest', 'http://hl7.org/fhir/StructureDefinition/ProcedureRequest'], 'type'=>'Reference', 'path'=>'ReferralRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'parent' => {'type'=>'Identifier', 'path'=>'ReferralRequest.parent', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/referralstatus'=>['draft', 'active', 'cancelled', 'completed', 'entered-in-error', 'draft', 'active', 'cancelled', 'completed', 'entered-in-error']}, 'type'=>'code', 'path'=>'ReferralRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/referralstatus'}},
      'category' => {'valid_codes'=>{'http://hl7.org/fhir/referralcategory'=>['proposal', 'plan', 'request', 'proposal', 'plan', 'request']}, 'type'=>'code', 'path'=>'ReferralRequest.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/referralcategory'}},
      'type' => {'type'=>'CodeableConcept', 'path'=>'ReferralRequest.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'stat', 'asap', 'routine', 'urgent', 'stat', 'asap']}, 'type'=>'CodeableConcept', 'path'=>'ReferralRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ReferralRequest.patient', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'ReferralRequest.context', 'min'=>0, 'max'=>1},
      'fulfillmentTime' => {'type'=>'Period', 'path'=>'ReferralRequest.fulfillmentTime', 'min'=>0, 'max'=>1},
      'authored' => {'type'=>'dateTime', 'path'=>'ReferralRequest.authored', 'min'=>0, 'max'=>1},
      'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ReferralRequest.requester', 'min'=>0, 'max'=>1},
      'specialty' => {'valid_codes'=>{'http://hl7.org/fhir/practitioner-specialty'=>['cardio', 'dent', 'dietary', 'midw', 'sysarch', 'cardio', 'dent', 'dietary', 'midw', 'sysarch']}, 'type'=>'CodeableConcept', 'path'=>'ReferralRequest.specialty', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/practitioner-specialty'}},
      'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ReferralRequest.recipient', 'min'=>0, 'max'=>Float::INFINITY},
      'reason' => {'type'=>'CodeableConcept', 'path'=>'ReferralRequest.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'description' => {'type'=>'string', 'path'=>'ReferralRequest.description', 'min'=>0, 'max'=>1},
      'serviceRequested' => {'valid_codes'=>{'http://snomed.info/sct'=>['408467006', '394577000', '394578005', '421661004', '408462000', '394579002', '394804000', '394580004', '394803006', '408480009', '408454008', '394809005', '394592004', '394600006', '394601005', '394581000', '408478003', '394812008', '408444009', '394582007', '408475000', '410005002', '394583002', '419772000', '394584008', '408443003', '394802001', '394915009', '394814009', '394808002', '394811001', '408446006', '394586005', '394916005', '408472002', '394597005', '394598000', '394807007', '419192003', '408468001', '394593009', '394813003', '410001006', '394589003', '394591006', '394599008', '394649004', '408470005', '394585009', '394821009', '422191005', '394594003', '416304004', '418960008', '394882004', '394806003', '394588006', '408459003', '394607009', '419610006', '418058008', '420208008', '418652005', '418535003', '418862001', '419365004', '418002000', '419983000', '419170002', '419472004', '394539006', '420112009', '409968004', '394587001', '394913002', '408440000', '418112009', '419815003', '394914008', '408455009', '394602003', '408447002', '394810000', '408450004', '408476004', '408469009', '408466002', '408471009', '408464004', '408441001', '408465003', '394605001', '394608004', '408461007', '408460008', '394606000', '408449004', '418018006', '394604002', '394609007', '408474001', '394610002', '394611003', '408477008', '394801008', '408463005', '419321007', '394576009', '394590007', '409967009', '408448007', '419043006', '394612005', '394733009', '394732004']}, 'type'=>'CodeableConcept', 'path'=>'ReferralRequest.serviceRequested', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes'}},
      'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ReferralRequest.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY}
    }

    attr_accessor :id                    # 0-1 id
    attr_accessor :meta                  # 0-1 Meta
    attr_accessor :implicitRules         # 0-1 uri
    attr_accessor :language              # 0-1 code
    attr_accessor :text                  # 0-1 Narrative
    attr_accessor :contained             # 0-* [ Resource ]
    attr_accessor :extension             # 0-* [ Extension ]
    attr_accessor :modifierExtension     # 0-* [ Extension ]
    attr_accessor :identifier            # 0-* [ Identifier ]
    attr_accessor :basedOn               # 0-* [ Reference(ReferralRequest|CarePlan|DiagnosticRequest|ProcedureRequest) ]
    attr_accessor :parent                # 0-1 Identifier
    attr_accessor :status                # 1-1 code
    attr_accessor :category              # 1-1 code
    attr_accessor :type                  # 0-1 CodeableConcept
    attr_accessor :priority              # 0-1 CodeableConcept
    attr_accessor :patient               # 0-1 Reference(Patient)
    attr_accessor :context               # 0-1 Reference(Encounter|EpisodeOfCare)
    attr_accessor :fulfillmentTime       # 0-1 Period
    attr_accessor :authored              # 0-1 dateTime
    attr_accessor :requester             # 0-1 Reference(Practitioner|Organization|Patient)
    attr_accessor :specialty             # 0-1 CodeableConcept
    attr_accessor :recipient             # 0-* [ Reference(Practitioner|Organization) ]
    attr_accessor :reason                # 0-1 CodeableConcept
    attr_accessor :description           # 0-1 string
    attr_accessor :serviceRequested      # 0-* [ CodeableConcept ]
    attr_accessor :supportingInformation # 0-* [ Reference(Resource) ]

    def resourceType
      'ReferralRequest'
    end
  end
end