require 'nokogiri'
module FHIR
  module Xml
    def self.from_xml(contents)
      FHIR::Model.from_xml(contents)
    end
  end
end
