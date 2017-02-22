module FHIR
  class QuestionnaireResponse < FHIR::Model
    SEARCH_PARAMS = ['author', 'authored', 'based-on', 'context', 'identifier', 'parent', 'patient', 'questionnaire', 'source', 'status', 'subject']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'QuestionnaireResponse.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'QuestionnaireResponse.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'QuestionnaireResponse.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'QuestionnaireResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'QuestionnaireResponse.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'QuestionnaireResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'QuestionnaireResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'QuestionnaireResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'identifier' => {'type'=>'Identifier', 'path'=>'QuestionnaireResponse.identifier', 'min'=>0, 'max'=>1},
      'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DiagnosticRequest', 'http://hl7.org/fhir/StructureDefinition/ReferralRequest', 'http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
      'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.parent', 'min'=>0, 'max'=>Float::INFINITY},
      'questionnaire' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Questionnaire'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.questionnaire', 'min'=>0, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/questionnaire-answers-status'=>['in-progress', 'completed', 'amended', 'entered-in-error', 'in-progress', 'completed', 'amended', 'entered-in-error']}, 'type'=>'code', 'path'=>'QuestionnaireResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/questionnaire-answers-status'}},
      'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.subject', 'min'=>0, 'max'=>1},
      'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.context', 'min'=>0, 'max'=>1},
      'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.author', 'min'=>0, 'max'=>1},
      'authored' => {'type'=>'dateTime', 'path'=>'QuestionnaireResponse.authored', 'min'=>0, 'max'=>1},
      'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'QuestionnaireResponse.source', 'min'=>0, 'max'=>1},
      'item' => {'type'=>'QuestionnaireResponse::Item', 'path'=>'QuestionnaireResponse.item', 'min'=>0, 'max'=>Float::INFINITY}
    }

    class Item < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'linkId' => {'type'=>'string', 'path'=>'Item.linkId', 'min'=>1, 'max'=>1},
        'definition' => {'type'=>'uri', 'path'=>'Item.definition', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'Item.text', 'min'=>0, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Item.subject', 'min'=>0, 'max'=>1},
        'answer' => {'type'=>'QuestionnaireResponse::Item::Answer', 'path'=>'Item.answer', 'min'=>0, 'max'=>Float::INFINITY},
        'item' => {'type'=>'QuestionnaireResponse::Item', 'path'=>'Item.item', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Answer < FHIR::Model
        MULTIPLE_TYPES = {
          'value' => ['boolean', 'decimal', 'integer', 'date', 'dateTime', 'instant', 'time', 'string', 'uri', 'Attachment', 'Coding', 'Quantity', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Answer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Answer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Answer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueInstant' => {'type'=>'instant', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>nil}},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Answer.value[x]', 'min'=>0, 'max'=>1},
          'item' => {'type'=>'QuestionnaireResponse::Item', 'path'=>'Answer.item', 'min'=>0, 'max'=>Float::INFINITY}
        }
      end
    end
  end
end
