module FHIR
  class Location < FHIR::Model
    SEARCH_PARAMS = ['address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'endpoint', 'identifier', 'name', 'near', 'near-distance', 'organization', 'partof', 'status', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Location.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Location.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Location.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Location.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Location.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Location.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/location-status'=>['active', 'suspended', 'inactive', 'active', 'suspended', 'inactive']}, 'type'=>'code', 'path'=>'Location.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-status'}},
      'name' => {'type'=>'string', 'path'=>'Location.name', 'min'=>0, 'max'=>1},
      'alias' => {'type'=>'string', 'path'=>'Location.alias', 'min'=>0, 'max'=>Float::INFINITY},
      'description' => {'type'=>'string', 'path'=>'Location.description', 'min'=>0, 'max'=>1},
      'mode' => {'valid_codes'=>{'http://hl7.org/fhir/location-mode'=>['instance', 'kind', 'instance', 'kind']}, 'type'=>'code', 'path'=>'Location.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-mode'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/v3/RoleCode'=>['DX', 'CVDX', 'CATH', 'ECHO', 'GIDX', 'ENDOS', 'RADDX', 'RADO', 'RNEU', 'HOSP', 'CHR', 'GACH', 'MHSP', 'PSYCHF', 'RH', 'RHAT', 'RHII', 'RHMAD', 'RHPI', 'RHPIH', 'RHPIMS', 'RHPIVS', 'RHYAD', 'HU', 'BMTU', 'CCU', 'CHEST', 'EPIL', 'ER', 'ETU', 'HD', 'HLAB', 'INLAB', 'OUTLAB', 'HRAD', 'HUSCS', 'ICU', 'PEDICU', 'PEDNICU', 'INPHARM', 'MBL', 'NCCS', 'NS', 'OUTPHARM', 'PEDU', 'PHU', 'RHU', 'SLEEP', 'NCCF', 'SNF', 'OF', 'ALL', 'AMPUT', 'BMTC', 'BREAST', 'CANC', 'CAPC', 'CARD', 'PEDCARD', 'COAG', 'CRS', 'DERM', 'ENDO', 'PEDE', 'ENT', 'FMC', 'GI', 'PEDGI', 'GIM', 'GYN', 'HEM', 'PEDHEM', 'HTN', 'IEC', 'INFD', 'PEDID', 'INV', 'LYMPH', 'MGEN', 'NEPH', 'PEDNEPH', 'NEUR', 'OB', 'OMS', 'ONCL', 'PEDHO', 'OPH', 'OPTC', 'ORTHO', 'HAND', 'PAINCL', 'PC', 'PEDC', 'PEDRHEUM', 'POD', 'PREV', 'PROCTO', 'PROFF', 'PROS', 'PSI', 'PSY', 'RHEUM', 'SPMED', 'SU', 'PLS', 'URO', 'TR', 'TRAVEL', 'WND', 'RTF', 'PRC', 'SURF', 'DADDR', 'MOBL', 'AMB', 'PHARM', 'ACC', 'COMM', 'CSC', 'PTRES', 'SCHOOL', 'UPC', 'WORK']}, 'type'=>'CodeableConcept', 'path'=>'Location.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/v3-ServiceDeliveryLocationRoleType'}},
      'telecom' => {'type'=>'ContactPoint', 'path'=>'Location.telecom', 'min'=>0, 'max'=>Float::INFINITY},
      'address' => {'type'=>'Address', 'path'=>'Location.address', 'min'=>0, 'max'=>1},
      'physicalType' => {'valid_codes'=>{'http://hl7.org/fhir/location-physical-type'=>['si', 'bu', 'wi', 'wa', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'area', 'jdn', 'si', 'bu', 'wi', 'wa', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'area', 'jdn']}, 'type'=>'CodeableConcept', 'path'=>'Location.physicalType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-physical-type'}},
      'position' => {'type'=>'Location::Position', 'path'=>'Location.position', 'min'=>0, 'max'=>1},
      'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Location.managingOrganization', 'min'=>0, 'max'=>1},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.partOf', 'min'=>0, 'max'=>1},
      'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Location.endpoint', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Position < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Position.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Position.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Position.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'longitude' => {'type'=>'decimal', 'path'=>'Position.longitude', 'min'=>1, 'max'=>1},
        'latitude' => {'type'=>'decimal', 'path'=>'Position.latitude', 'min'=>1, 'max'=>1},
        'altitude' => {'type'=>'decimal', 'path'=>'Position.altitude', 'min'=>0, 'max'=>1}
      }
    end
  end
end
