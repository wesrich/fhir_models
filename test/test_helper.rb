require 'simplecov'
SimpleCov.start

require 'nokogiri/diff'
require 'test/unit'
require 'webmock/test_unit'
require 'pry'

WebMock.disable_net_connect!(allow: %w{codeclimate.com})

require 'fhir_models'
FHIR.logger.level = Logger::INFO
