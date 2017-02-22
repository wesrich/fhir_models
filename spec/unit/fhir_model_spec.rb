require 'pry'

shared_context 'a FHIR Model' do |model_name|
  let(:expected_hash) { { id: '123' } }
  let(:hash_with_resource_type) { expected_hash.merge(resourceType: model_name) }
  let(:fhir_object) { described_class.new(expected_hash) }

  let(:expected_json) { hash_with_resource_type.to_json }
  let(:expected_xml) { hash_with_resource_type.to_xml }

  context '.new' do
    it 'instantiates the current class' do
      expect(described_class.new(expected_hash)).to be_a described_class
    end

    it 'instantiates another class when passed resourceType' do
      expect(described_class.new(expected_hash.merge('resourceType' => 'Patient'))).to be_a FHIR::Patient
    end
  end

  context '#resourceType' do
    it 'returns the demodulized class name' do
      expect(described_class.new.resourceType).to eq model_name
    end
  end

  context 'to_fhir' do
    context 'json' do
      it 'returns a JSON representation of a FHIR Model' do
        expect(fhir_object.to_fhir).to eq expected_json
        expect(fhir_object.to_fhir_json).to eq expected_json
        expect(fhir_object.to_fhir(format: :json)).to eq expected_json
      end

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end

    context 'xml', :skip do
      it 'returns an XML representation of a FHIR Model'

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end
  end

  context 'from_fhir' do
    context 'json' do
      it 'parses JSON into a FHIR Model' do
        expect(described_class.from_fhir(expected_json)).to eq fhir_object
      end

      it 'allows passing in nested FHIR Models' do
        json = expected_hash.merge('nested' => { 'resourceType' => 'Patient' }).to_json
        result = described_class.from_fhir(json)
        expect(result).to be_a(described_class)
        expect(result.nested).to be_a FHIR::Patient
      end

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end

    context 'xml', :skip do
      it 'parses XML into a FHIR Model' do
        expect(fhir_object.to_fhir_xml).to eq expected_xml
        expect(fhir_object.to_fhir(format: :xml)).to eq expected_xml
      end

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end
  end
end

describe FHIR::Model do
  context '.new' do
    it 'cannot be instantiated' do
      # expect { FHIR::Model.new }.to raise_error(NotImplementedError)
    end

    it 'returns a subclass of resourceType' do
      expect(FHIR::Model.new('resourceType' => 'Patient')).to be_a FHIR::Patient
    end
  end

  %w(Patient Resource).each do |model_name|
    describe FHIR.const_get(model_name) do
      it_behaves_like 'a FHIR Model', model_name
    end
  end
end
