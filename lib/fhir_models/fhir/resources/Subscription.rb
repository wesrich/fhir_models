module FHIR
  class Subscription < FHIR::Model
    SEARCH_PARAMS = ['contact', 'criteria', 'payload', 'status', 'tag', 'type', 'url']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Subscription.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Subscription.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Subscription.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Subscription.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'text' => {'type'=>'Narrative', 'path'=>'Subscription.text', 'min'=>0, 'max'=>1},
      'contained' => {'type'=>'Resource', 'path'=>'Subscription.contained', 'min'=>0, 'max'=>Float::INFINITY},
      'extension' => {'type'=>'Extension', 'path'=>'Subscription.extension', 'min'=>0, 'max'=>Float::INFINITY},
      'modifierExtension' => {'type'=>'Extension', 'path'=>'Subscription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
      'criteria' => {'type'=>'string', 'path'=>'Subscription.criteria', 'min'=>1, 'max'=>1},
      'contact' => {'type'=>'ContactPoint', 'path'=>'Subscription.contact', 'min'=>0, 'max'=>Float::INFINITY},
      'reason' => {'type'=>'string', 'path'=>'Subscription.reason', 'min'=>1, 'max'=>1},
      'status' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-status'=>['requested', 'active', 'error', 'off', 'requested', 'active', 'error', 'off']}, 'type'=>'code', 'path'=>'Subscription.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-status'}},
      'error' => {'type'=>'string', 'path'=>'Subscription.error', 'min'=>0, 'max'=>1},
      'channel' => {'type'=>'Subscription::Channel', 'path'=>'Subscription.channel', 'min'=>1, 'max'=>1},
      'end' => {'type'=>'instant', 'path'=>'Subscription.end', 'min'=>0, 'max'=>1},
      'tag' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-tag'=>['queued', 'delivered', 'queued', 'delivered']}, 'type'=>'Coding', 'path'=>'Subscription.tag', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-tag'}}
    }

    class Channel < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Channel.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Channel.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Channel.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-channel-type'=>['rest-hook', 'websocket', 'email', 'sms', 'message', 'rest-hook', 'websocket', 'email', 'sms', 'message']}, 'type'=>'code', 'path'=>'Channel.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-channel-type'}},
        'endpoint' => {'type'=>'uri', 'path'=>'Channel.endpoint', 'min'=>0, 'max'=>1},
        'payload' => {'type'=>'string', 'path'=>'Channel.payload', 'min'=>0, 'max'=>1},
        'header' => {'type'=>'string', 'path'=>'Channel.header', 'min'=>0, 'max'=>1}
      }
    end
  end
end
