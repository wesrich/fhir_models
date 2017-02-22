module FHIR
  class Task < FHIR::Model
    MULTIPLE_TYPES = {
      'definition' => ['uri', 'Reference']
    }
    SEARCH_PARAMS = ['authored-on', 'based-on', 'business-status', 'code', 'context', 'definition-ref', 'focus', 'group-identifier', 'identifier', 'intent', 'modified', 'organization', 'owner', 'part-of', 'patient', 'performer', 'period', 'priority', 'requester', 'status', 'statusreason', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Task.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Task.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Task.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Task.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Task.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Task.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Task.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Task.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'Task.identifier', 'min'=>0, 'max'=>Float::INFINITY},
      'definitionUri' => {'type'=>'uri', 'path'=>'Task.definition[x]', 'min'=>0, 'max'=>1},
      'definitionReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ActivityDefinition'], 'type'=>'Reference', 'path'=>'Task.definition[x]', 'min'=>0, 'max'=>1},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'groupIdentifier' => {'type'=>'Identifier', 'path'=>'Task.groupIdentifier', 'min'=>0, 'max'=>1},
      'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'Task.partOf', 'min'=>0, 'max'=>Float::INFINITY},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/task-status'=>['draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'cancelled', 'in-progress', 'on-hold', 'failed', 'completed', 'entered-in-error', 'draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'cancelled', 'in-progress', 'on-hold', 'failed', 'completed', 'entered-in-error']}, 'type'=>'code', 'path'=>'Task.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-status'}},
      'statusReason' => {'type'=>'CodeableConcept', 'path'=>'Task.statusReason', 'min'=>0, 'max'=>1},
      'businessStatus' => {'type'=>'CodeableConcept', 'path'=>'Task.businessStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'intent' => {'valid_codes'=>{'http://hl7.org/fhir/request-intent'=>['proposal', 'plan', 'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order', 'option', 'proposal', 'plan', 'order', 'option']}, 'type'=>'code', 'path'=>'Task.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-intent'}},
      'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'stat', 'asap', 'routine', 'urgent', 'stat', 'asap']}, 'type'=>'code', 'path'=>'Task.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
      'code' => {'type'=>'CodeableConcept', 'path'=>'Task.code', 'min'=>0, 'max'=>1},
      'description' => {'type'=>'string', 'path'=>'Task.description', 'min'=>0, 'max'=>1},
      'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.focus', 'min'=>0, 'max'=>1},
      'for' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.for', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Task.context', 'min'=>0, 'max'=>1},
      'executionPeriod' => {'type'=>'Period', 'path'=>'Task.executionPeriod', 'min'=>0, 'max'=>1},
      'authoredOn' => {'type'=>'dateTime', 'path'=>'Task.authoredOn', 'min'=>0, 'max'=>1},
      'lastModified' => {'type'=>'dateTime', 'path'=>'Task.lastModified', 'min'=>0, 'max'=>1},
      'requester' => {'type'=>'Task::Requester', 'path'=>'Task.requester', 'min'=>0, 'max'=>1},
      'performerType' => {'valid_codes'=>{'http://hl7.org/fhir/task-performer-type'=>['requester', 'dispatcher', 'scheduler', 'performer', 'monitor', 'manager', 'acquirer', 'reviewer', 'requester', 'dispatcher', 'performer', 'monitor', 'manager', 'acquirer', 'reviewer']}, 'type'=>'CodeableConcept', 'path'=>'Task.performerType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/task-performer-type'}},
      'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.owner', 'min'=>0, 'max'=>1},
      'reason' => {'type'=>'CodeableConcept', 'path'=>'Task.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
      'note' => {'type'=>'Annotation', 'path'=>'Task.note', 'min'=>0, 'max'=>Float::INFINITY},
      'relevantHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'Task.relevantHistory', 'min'=>0, 'max'=>Float::INFINITY},
      'restriction' => {'type'=>'Task::Restriction', 'path'=>'Task.restriction', 'min'=>0, 'max'=>1},
      'input' => {'type'=>'Task::Input', 'path'=>'Task.input', 'min'=>0, 'max'=>Float::INFINITY},
      'output' => {'type'=>'Task::Output', 'path'=>'Task.output', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Requester < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Requester.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Requester.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Requester.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'agent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Requester.agent', 'min'=>1, 'max'=>1},
        'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Requester.onBehalfOf', 'min'=>0, 'max'=>1}
      }
    end

    class Restriction < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Restriction.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Restriction.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Restriction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'repetitions' => {'type'=>'positiveInt', 'path'=>'Restriction.repetitions', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Restriction.period', 'min'=>0, 'max'=>1},
        'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Restriction.recipient', 'min'=>0, 'max'=>Float::INFINITY}
      }
    end

    class Input < FHIR::Model
      MULTIPLE_TYPES = {
        'value' => ['base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'Timing', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Input.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAge' => {'type'=>'Age', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueCount' => {'type'=>'Count', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDistance' => {'type'=>'Distance', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMoney' => {'type'=>'Money', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1}
      }
    end

    class Output < FHIR::Model
      MULTIPLE_TYPES = {
        'value' => ['base64Binary', 'boolean', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'Reference', 'SampledData', 'Signature', 'Timing', 'Meta']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Output.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Output.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Output.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Output.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
        'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueBoolean' => {'type'=>'boolean', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCode' => {'type'=>'code', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDate' => {'type'=>'date', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDateTime' => {'type'=>'dateTime', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDecimal' => {'type'=>'decimal', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueId' => {'type'=>'id', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInstant' => {'type'=>'instant', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueInteger' => {'type'=>'integer', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMarkdown' => {'type'=>'markdown', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueOid' => {'type'=>'oid', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueString' => {'type'=>'string', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTime' => {'type'=>'time', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueUri' => {'type'=>'uri', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAddress' => {'type'=>'Address', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAge' => {'type'=>'Age', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueAttachment' => {'type'=>'Attachment', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCoding' => {'type'=>'Coding', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueCount' => {'type'=>'Count', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDistance' => {'type'=>'Distance', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueDuration' => {'type'=>'Duration', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueHumanName' => {'type'=>'HumanName', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMoney' => {'type'=>'Money', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valuePeriod' => {'type'=>'Period', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueQuantity' => {'type'=>'Quantity', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRange' => {'type'=>'Range', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueRatio' => {'type'=>'Ratio', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueReference' => {'type'=>'Reference', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSampledData' => {'type'=>'SampledData', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueSignature' => {'type'=>'Signature', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueTiming' => {'type'=>'Timing', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
        'valueMeta' => {'type'=>'Meta', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1}
      }
    end
  end
end
