require 'pry'

shared_context 'a FHIR Model' do |model_name|
  let(:expected_hash) { { id: '123' } }
  let(:expected_json) { expected_hash.merge(resourceType: model_name).to_json }
  let(:expected_xml) { expected_hash.merge(resourceType: model_name).to_json }

  context '#resourceType' do
    it 'returns the demodulized class name' do
      expect(described_class.new.resourceType).to eq model_name
    end
  end

  context 'from_fhir' do
    context 'json' do
      it 'parses JSON into a FHIR Model' do
        expect(described_class.new(expected_hash).to_fhir).to eq expected_json
        expect(described_class.new(expected_hash).to_fhir_json).to eq expected_json
        expect(described_class.new(expected_hash).to_fhir(format: :json)).to eq expected_json
      end

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end

    context 'xml' do
      it 'parses XML into a FHIR Model', :skip do
        expect(described_class.new(expected_hash).to_fhir_xml).to eq expected_xml
        expect(described_class.new(expected_hash).to_fhir(format: :xml)).to eq expected_xml
      end

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end
  end

  context 'to_fhir' do
    context 'json' do
      it 'returns a JSON representation of a FHIR Model'

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end

    context 'xml' do
      it 'returns an XML representation of a FHIR Model'

      it 'allows passing in a FHIR Version context'

      it 'allows passing in a FHIR Profile context'
    end
  end
end

describe FHIR::Model do
  context '.new' do
    it 'cannot be instantiated' do
      expect { FHIR::Model.new }.to raise_error(NotImplementedError)
    end

    it 'returns a subclass of resourceType' do
      expect(FHIR::Model.new('resourceType' => 'Patient')).to be_a FHIR::Patient
    end
  end

  describe FHIR::Patient do
    it_behaves_like 'a FHIR Model', 'Patient'
  end
end
