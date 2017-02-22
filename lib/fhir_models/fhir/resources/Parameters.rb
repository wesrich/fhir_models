module FHIR
  class Parameters < FHIR::Model
    SEARCH_PARAMS =
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Parameters.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Parameters.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Parameters.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Parameters.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'parameter' => {'type'=>'Parameters::Parameter', 'path'=>'Parameters.parameter', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Parameter < FHIR::Model
      MULTIPLE_TYPES = {
        'value' => ['base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'Timing', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueAge' => {'type'=>'Age', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueCount' => {'type'=>'Count', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueDistance' => {'type'=>'Distance', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueMoney' => {'type'=>'Money', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'Resource', 'path'=>'Parameter.resource', 'min'=>0, 'max'=>1},
        'part' => {'type'=>'Parameters::Parameter', 'path'=>'Parameter.part', 'min'=>0, 'max'=>Float::INFINITY}
      }
    end
  end
end
