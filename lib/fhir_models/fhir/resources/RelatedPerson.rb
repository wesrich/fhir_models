module FHIR
  class RelatedPerson < FHIR::Model
    SEARCH_PARAMS = ['address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'birthdate', 'email', 'gender', 'phone', 'phonetic', 'telecom', 'active', 'identifier', 'name', 'patient']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'RelatedPerson.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'RelatedPerson.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'RelatedPerson.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'RelatedPerson.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'RelatedPerson.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'RelatedPerson.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'RelatedPerson.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedPerson.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'RelatedPerson.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'active' => {'type'=>'boolean', 'path'=>'RelatedPerson.active', 'min'=>0, 'max'=>1},
      'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'RelatedPerson.patient', 'min'=>1, 'max'=>1},
      'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/v2/0131'=>['BP', 'C', 'CP', 'E', 'EP', 'F', 'I', 'N', 'O', 'PR', 'S', 'U'], 'http://hl7.org/fhir/v3/RoleCode'=>['FAMMEMB', 'CHILD', 'CHLDADOPT', 'DAUADOPT', 'SONADOPT', 'CHLDFOST', 'DAUFOST', 'SONFOST', 'DAUC', 'DAU', 'STPDAU', 'NCHILD', 'SON', 'SONC', 'STPSON', 'STPCHLD', 'EXT', 'AUNT', 'MAUNT', 'PAUNT', 'COUSN', 'MCOUSN', 'PCOUSN', 'GGRPRN', 'GGRFTH', 'MGGRFTH', 'PGGRFTH', 'GGRMTH', 'MGGRMTH', 'PGGRMTH', 'MGGRPRN', 'PGGRPRN', 'GRNDCHILD', 'GRNDDAU', 'GRNDSON', 'GRPRN', 'GRFTH', 'MGRFTH', 'PGRFTH', 'GRMTH', 'MGRMTH', 'PGRMTH', 'MGRPRN', 'PGRPRN', 'INLAW', 'CHLDINLAW', 'DAUINLAW', 'SONINLAW', 'PRNINLAW', 'FTHINLAW', 'MTHINLAW', 'SIBINLAW', 'BROINLAW', 'SISINLAW', 'NIENEPH', 'NEPHEW', 'NIECE', 'UNCLE', 'MUNCLE', 'PUNCLE', 'PRN', 'ADOPTP', 'ADOPTF', 'ADOPTM', 'FTH', 'FTHFOST', 'NFTH', 'NFTHF', 'STPFTH', 'MTH', 'GESTM', 'MTHFOST', 'NMTH', 'NMTHF', 'STPMTH', 'NPRN', 'PRNFOST', 'STPPRN', 'SIB', 'BRO', 'HBRO', 'NBRO', 'TWINBRO', 'FTWINBRO', 'ITWINBRO', 'STPBRO', 'HSIB', 'HSIS', 'NSIB', 'NSIS', 'TWINSIS', 'FTWINSIS', 'ITWINSIS', 'TWIN', 'FTWIN', 'ITWIN', 'SIS', 'STPSIS', 'STPSIB', 'SIGOTHR', 'DOMPART', 'FMRSPS', 'SPS', 'HUSB', 'WIFE', 'FRND', 'NBOR', 'ONESELF', 'ROOM']}, 'type'=>'CodeableConcept', 'path'=>'RelatedPerson.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype'}},
      'name' => {'type'=>'HumanName', 'path'=>'RelatedPerson.name', 'min'=>0, 'max'=>Float::INFINITY},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'RelatedPerson.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown', 'male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'RelatedPerson.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
      'birthDate' => {'type'=>'date', 'path'=>'RelatedPerson.birthDate', 'min'=>0, 'max'=>1},
      'address' => {'type'=>'Address', 'path'=>'RelatedPerson.address', 'min'=>0, 'max'=>Float::INFINITY},
      'photo' => {'type'=>'Attachment', 'path'=>'RelatedPerson.photo', 'min'=>0, 'max'=>Float::INFINITY},
      'period' => {'type'=>'Period', 'path'=>'RelatedPerson.period', 'min'=>0, 'max'=>1}
    }
  end
end
