require_relative '../test_helper'

class ProfileValidationTest < Test::Unit::TestCase
  ERROR_DIR = File.join('tmp', 'errors', 'ProfileValidationTest')
  EXAMPLE_ROOT = File.join('lib', 'fhir_models', 'examples', 'json')
  FIXTURE_ROOT = File.join('lib', 'fhir_models', 'examples', 'fixtures')

  # Automatically generate one test method per profiled file
  example_files = File.join(EXAMPLE_ROOT, '**', '*qicore.json')
  FHIR.logger.warn 'No QICore Examples Found' if Dir[example_files].empty?

  # Create a blank folder for the errors
  FileUtils.rm_rf(ERROR_DIR) if File.directory?(ERROR_DIR)
  FileUtils.mkdir_p ERROR_DIR

  Dir.glob(example_files).each do |example_file|
    example_name = File.basename(example_file, '.json')
    define_method("test_profile_validation_#{example_name}") do
      run_profile_validation_test(example_file, example_name)
    end
  end

  def run_profile_validation_test(example_file, example_name)
    input_json = File.read(example_file)
    resource = FHIR::Json.from_json(input_json)
    profile_uri = "http://hl7.org/fhir/StructureDefinition/qicore-#{resource.resourceType.downcase}"
    profile = FHIR::Definitions.get_profile(profile_uri)
    assert profile.is_a?(FHIR::StructureDefinition), 'Profile is not a valid StructureDefinition.'
    errors = profile.validate_resource(resource)
    unless errors.empty?
      File.open("#{ERROR_DIR}/#{example_name}.err", 'w:UTF-8') { |file| errors.each { |e| file.write("#{e}\n") } }
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') { |file| file.write(input_json) }
    end
    assert errors.empty?, 'Resource failed to validate.'
  end

  def test_language_binding_validation
    binding_strength = FHIR::Resource::METADATA['language']['binding']['strength']
    FHIR::Resource::METADATA['language']['binding']['strength'] = 'required'
    model = FHIR::Resource.new('language' => 'en-US')
    assert model.is_valid?, 'Language validation failed.'
    FHIR::Resource::METADATA['language']['binding']['strength'] = binding_strength
  end

  def test_first_order_profile_cardinality
    profile_json = File.read(File.join(FIXTURE_ROOT, 'custom_patient_profile.json'))
    profile = FHIR::Json.from_json(profile_json) # profile that specifies one and only one name

    patient_json = File.read(File.join(FIXTURE_ROOT, 'first_order_invalid_patient.json'))
    patient = FHIR::Json.from_json(patient_json) # patient with two names

    errors = profile.validate_resource(patient)
    assert errors.include?("Patient.name failed cardinality test (1..1) -- found 2"), "Profile failed to note cardinality error on name attribute."
  end

  def test_optional_second_order_profile_cardinality
    profile_json = File.read(File.join(FIXTURE_ROOT, 'custom_patient_profile.json'))
    profile = FHIR::Json.from_json(profile_json) # this profile enforces a mandatory element on an optional backbone element)

    valid_patient_json = File.read(File.join(FIXTURE_ROOT, 'valid_patient.json'))
    valid_patient = FHIR::Json.from_json(valid_patient_json) # patient without backbone element 'communication'

    patient_json = File.read(File.join(FIXTURE_ROOT, 'second_order_invalid_patient.json'))
    patient = FHIR::Json.from_json(patient_json) # patient with backbone element but no mandatory subelement

    errors = profile.validate_resource(valid_patient)
    assert errors.empty?, 'Profile erroneously enforced cardinality on the mandatory subelement of an optional backbone element that did not exist.'

    errors = profile.validate_resource(patient)
    assert errors.include?("Patient.communication.language failed cardinality test (1..1) -- found 0"), "Profile failed to note cardinality error on mandatory sub-element of optional backbone element."
  end
end
