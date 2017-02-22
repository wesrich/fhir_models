module FHIR
  class RequestGroup < FHIR::Model
    MULTIPLE_TYPES = {
      'reason' => ['CodeableConcept', 'Reference']
    }
    SEARCH_PARAMS = ['author', 'context', 'encounter', 'participant', 'patient', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'RequestGroup.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'RequestGroup.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'RequestGroup.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'RequestGroup.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'RequestGroup.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'RequestGroup.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'RequestGroup.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'RequestGroup.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'RequestGroup.identifier', 'min'=>0, 'max'=>1},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'RequestGroup.subject', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'RequestGroup.context', 'min'=>0, 'max'=>1},
      'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'RequestGroup.occurrenceDateTime', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'RequestGroup.author', 'min'=>0, 'max'=>1},
      'reasonCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'RequestGroup.reason[x]', 'min'=>0, 'max'=>1},
      'reasonReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RequestGroup.reason[x]', 'min'=>0, 'max'=>1},
      'note' => {'type'=>'Annotation', 'path'=>'RequestGroup.note', 'min'=>0, 'max'=>Float::INFINITY},
      'action' => {'type'=>'RequestGroup::Action', 'path'=>'RequestGroup.action', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Action < FHIR::Model
      MULTIPLE_TYPES = {
        'timing' => ['dateTime', 'Period', 'Duration', 'Range', 'Timing']
      }
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'actionIdentifier' => {'type'=>'Identifier', 'path'=>'Action.actionIdentifier', 'min'=>0, 'max'=>1},
        'label' => {'type'=>'string', 'path'=>'Action.label', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Action.title', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Action.description', 'min'=>0, 'max'=>1},
        'textEquivalent' => {'type'=>'string', 'path'=>'Action.textEquivalent', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'CodeableConcept', 'path'=>'Action.code', 'min'=>0, 'max'=>Float::INFINITY},
        'documentation' => {'type'=>'RelatedArtifact', 'path'=>'Action.documentation', 'min'=>0, 'max'=>Float::INFINITY},
        'condition' => {'type'=>'RequestGroup::Action::Condition', 'path'=>'Action.condition', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedAction' => {'type'=>'RequestGroup::Action::RelatedAction', 'path'=>'Action.relatedAction', 'min'=>0, 'max'=>Float::INFINITY},
        'timingDateTime' => {'type'=>'dateTime', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingDuration' => {'type'=>'Duration', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingRange' => {'type'=>'Range', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'timingTiming' => {'type'=>'Timing', 'path'=>'Action.timing[x]', 'min'=>0, 'max'=>1},
        'participant' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Person', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Action.participant', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/action-type'=>['create', 'update', 'remove', 'fire-event', 'create', 'update', 'remove', 'fire-event']}, 'type'=>'Coding', 'path'=>'Action.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/action-type'}},
        'groupingBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/action-grouping-behavior'=>['visual-group', 'logical-group', 'sentence-group', 'visual-group', 'logical-group', 'sentence-group']}, 'type'=>'code', 'path'=>'Action.groupingBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-grouping-behavior'}},
        'selectionBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/action-selection-behavior'=>['any', 'all', 'all-or-none', 'exactly-one', 'at-most-one', 'one-or-more', 'any', 'all', 'all-or-none', 'exactly-one', 'at-most-one', 'one-or-more']}, 'type'=>'code', 'path'=>'Action.selectionBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-selection-behavior'}},
        'requiredBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/action-required-behavior'=>['must', 'could', 'must-unless-documented', 'must', 'could', 'must-unless-documented']}, 'type'=>'code', 'path'=>'Action.requiredBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-required-behavior'}},
        'precheckBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/action-precheck-behavior'=>['yes', 'no', 'yes', 'no']}, 'type'=>'code', 'path'=>'Action.precheckBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-precheck-behavior'}},
        'cardinalityBehavior' => {'valid_codes'=>{'http://hl7.org/fhir/action-cardinality-behavior'=>['single', 'multiple', 'single', 'multiple']}, 'type'=>'code', 'path'=>'Action.cardinalityBehavior', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-cardinality-behavior'}},
        'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Action.resource', 'min'=>0, 'max'=>1},
        'action' => {'type'=>'RequestGroup::Action', 'path'=>'Action.action', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Condition < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Condition.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Condition.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Condition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'kind' => {'valid_codes'=>{'http://hl7.org/fhir/action-condition-kind'=>['applicability', 'start', 'stop', 'applicability', 'start', 'stop']}, 'type'=>'code', 'path'=>'Condition.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-condition-kind'}},
          'description' => {'type'=>'string', 'path'=>'Condition.description', 'min'=>0, 'max'=>1},
          'language' => {'type'=>'string', 'path'=>'Condition.language', 'min'=>0, 'max'=>1},
          'expression' => {'type'=>'string', 'path'=>'Condition.expression', 'min'=>0, 'max'=>1}
        }
      end

      class RelatedAction < FHIR::Model
        MULTIPLE_TYPES = {
          'offset' => ['Duration', 'Range']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RelatedAction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RelatedAction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedAction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'actionIdentifier' => {'type'=>'Identifier', 'path'=>'RelatedAction.actionIdentifier', 'min'=>1, 'max'=>1},
          'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/action-relationship-type'=>['before-start', 'before', 'before-end', 'concurrent-with-start', 'concurrent', 'concurrent-with-end', 'after-start', 'after', 'after-end', 'before-start', 'before', 'before-end', 'concurrent-with-start', 'concurrent', 'concurrent-with-end', 'after-start', 'after', 'after-end']}, 'type'=>'code', 'path'=>'RelatedAction.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/action-relationship-type'}},
          'offsetDuration' => {'type'=>'Duration', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1},
          'offsetRange' => {'type'=>'Range', 'path'=>'RelatedAction.offset[x]', 'min'=>0, 'max'=>1}
        }
      end
    end
  end
end
