require_relative '../test_helper'

class FhirClientTest < Test::Unit::TestCase
  def test_that_it_has_a_version_number
    pend 'Is this really useful?'
    refute_nil ::FHIR::Client::VERSION
  end
end
