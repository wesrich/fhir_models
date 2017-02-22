module FHIR
  class Bundle < FHIR::Model
    SEARCH_PARAMS = ['composition', 'identifier', 'message', 'type']
    METADATA = {
      'id' => {'type'=>'id', 'path'=>'Bundle.id', 'min'=>0, 'max'=>1},
      'meta' => {'type'=>'Meta', 'path'=>'Bundle.meta', 'min'=>0, 'max'=>1},
      'implicitRules' => {'type'=>'uri', 'path'=>'Bundle.implicitRules', 'min'=>0, 'max'=>1},
      'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['bn', 'cs', 'da', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fy', 'fy-NL', 'hr', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pt', 'pt-BR', 'ru', 'ru-RU', 'sr', 'sr-SP', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Bundle.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
      'type' => {'valid_codes'=>{'http://hl7.org/fhir/bundle-type'=>['document', 'message', 'transaction', 'transaction-response', 'batch', 'batch-response', 'history', 'searchset', 'collection', 'document', 'message', 'transaction', 'transaction-response', 'batch', 'batch-response', 'history', 'searchset', 'collection']}, 'type'=>'code', 'path'=>'Bundle.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/bundle-type'}},
      'identifier' => {'type'=>'Identifier', 'path'=>'Bundle.identifier', 'min'=>0, 'max'=>1},
      'total' => {'type'=>'unsignedInt', 'path'=>'Bundle.total', 'min'=>0, 'max'=>1},
      'link' => {'type'=>'Bundle::Link', 'path'=>'Bundle.link', 'min'=>0, 'max'=>Float::INFINITY},
      'entry' => {'type'=>'Bundle::Entry', 'path'=>'Bundle.entry', 'min'=>0, 'max'=>Float::INFINITY},
      'signature' => {'type'=>'Signature', 'path'=>'Bundle.signature', 'min'=>0, 'max'=>1}
    }

    class Link < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'relation' => {'type'=>'string', 'path'=>'Link.relation', 'min'=>1, 'max'=>1},
        'url' => {'type'=>'uri', 'path'=>'Link.url', 'min'=>1, 'max'=>1}
      }
    end

    class Entry < FHIR::Model
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Entry.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Entry.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Entry.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'link' => {'type'=>'Bundle::Link', 'path'=>'Entry.link', 'min'=>0, 'max'=>Float::INFINITY},
        'fullUrl' => {'type'=>'uri', 'path'=>'Entry.fullUrl', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'Resource', 'path'=>'Entry.resource', 'min'=>0, 'max'=>1},
        'search' => {'type'=>'Bundle::Entry::Search', 'path'=>'Entry.search', 'min'=>0, 'max'=>1},
        'request' => {'type'=>'Bundle::Entry::Request', 'path'=>'Entry.request', 'min'=>0, 'max'=>1},
        'response' => {'type'=>'Bundle::Entry::Response', 'path'=>'Entry.response', 'min'=>0, 'max'=>1}
      }

      class Search < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Search.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Search.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Search.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/search-entry-mode'=>['match', 'include', 'outcome', 'match', 'include', 'outcome']}, 'type'=>'code', 'path'=>'Search.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-entry-mode'}},
          'score' => {'type'=>'decimal', 'path'=>'Search.score', 'min'=>0, 'max'=>1}
        }
      end

      class Request < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Request.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Request.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Request.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://hl7.org/fhir/http-verb'=>['GET', 'POST', 'PUT', 'DELETE', 'GET', 'POST', 'PUT', 'DELETE']}, 'type'=>'code', 'path'=>'Request.method', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/http-verb'}},
          'url' => {'type'=>'uri', 'path'=>'Request.url', 'min'=>1, 'max'=>1},
          'ifNoneMatch' => {'type'=>'string', 'path'=>'Request.ifNoneMatch', 'min'=>0, 'max'=>1},
          'ifModifiedSince' => {'type'=>'instant', 'path'=>'Request.ifModifiedSince', 'min'=>0, 'max'=>1},
          'ifMatch' => {'type'=>'string', 'path'=>'Request.ifMatch', 'min'=>0, 'max'=>1},
          'ifNoneExist' => {'type'=>'string', 'path'=>'Request.ifNoneExist', 'min'=>0, 'max'=>1}
        }
      end

      class Response < FHIR::Model
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Response.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Response.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Response.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'status' => {'type'=>'string', 'path'=>'Response.status', 'min'=>1, 'max'=>1},
          'location' => {'type'=>'uri', 'path'=>'Response.location', 'min'=>0, 'max'=>1},
          'etag' => {'type'=>'string', 'path'=>'Response.etag', 'min'=>0, 'max'=>1},
          'lastModified' => {'type'=>'instant', 'path'=>'Response.lastModified', 'min'=>0, 'max'=>1},
          'outcome' => {'type'=>'Resource', 'path'=>'Response.outcome', 'min'=>0, 'max'=>1}
        }
      end
    end
  end
end
