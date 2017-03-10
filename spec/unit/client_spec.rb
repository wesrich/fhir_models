require 'spec_helper'

describe FHIR::Client do
  let(:iss) { 'http://fhir.example.com' }
  let(:example_json) { File.read('./spec/fixtures/json/patient-example.json') }
  let(:fhir_headers) do
    { 'Accept' => 'application/fhir+json' }
  end
  let(:example_patient_id) { '575577' }
  subject { FHIR::Client.new(iss) }

  context '#read' do
    it 'constructs a valid FHIR request with the ID' do
      stub_request(:get, "#{iss}/Patient/#{example_patient_id}")
        .with(headers: fhir_headers)
        .to_return(body: example_json)
      response = subject.read(FHIR::Patient, example_patient_id)

      expect(response).to be_a FHIR::ClientReply
      expect(response.response.code).to eq 200
      expect(response.resource).to be_a FHIR::Patient
    end

    context 'with invalid parameters' do
      it 'returns an exception object' do
        error_response = '{ "resourceType": "OperationOutcome", "issue": { "diagnostics": "Patient not found" } }'
        stub_request(:get, "#{iss}/Patient/#{example_patient_id}")
          .with(headers: fhir_headers)
          .to_return(status: 404, body: error_response)
        response = subject.read(FHIR::Patient, example_patient_id)

        expect(response).to be_a FHIR::ClientException
        expect(response.resource).to be_a FHIR::OperationOutcome
        expect(response.response.code).to eq 404
        expect(response.response.body).to eq error_response
      end
    end
  end

  context '#search' do
    let(:example_json) { File.read('./spec/fixtures/json/search-example.json') }

    context 'without parameters' do
      it 'constructs a valid FHIR request' do
        stub_request(:get, "#{iss}/Patient")
          .with(headers: fhir_headers)
          .to_return(body: example_json)
        response = subject.search(FHIR::Patient)

        expect(response).to be_a FHIR::ClientReply
        expect(response.response.code).to eq 200
        expect(response.resource).to be_a FHIR::Bundle
      end
    end

    context 'with params' do
      it 'constructs a valid FHIR request' do
        stub_request(:get, "#{iss}/Patient?name=John&_count=1")
          .with(headers: fhir_headers)
          .to_return(body: example_json)
        response = subject.search(FHIR::Patient, name: 'John', _count: 1)

        expect(response).to be_a FHIR::ClientReply
        expect(response.response.code).to eq 200
        expect(response.resource).to be_a FHIR::Bundle
      end
    end

    context 'with invalid parameters' do
      it 'returns an exception object' do
        error_response = '{ "resourceType": "OperationOutcome", "issue": { "diagnostics": "Unsupported resource type \'Patient\'" } }'
        stub_request(:get, "#{iss}/Patient")
          .with(headers: fhir_headers)
          .to_return(status: 400, body: error_response)
        response = subject.search(FHIR::Patient)

        expect(response).to be_a FHIR::ClientException
        expect(response.resource).to be_a FHIR::OperationOutcome
        expect(response.response.code).to eq 400
        expect(response.response.body).to eq error_response
      end
    end
  end

  context '#create' do
    context 'with valid content' do
      it 'returns a successful status code' do
        stub_request(:post, "#{iss}/Patient")
          .with(headers: fhir_headers)
          .to_return(status: 201, body: '')
        response = subject.create(FHIR::Patient, name: 'John')

        expect(response).to be_a FHIR::ClientReply
        expect(response.response.code).to eq 201
        expect(response.resource).to be_nil
      end

      it 'can parse a response from the server' do
        stub_request(:post, "#{iss}/Patient")
          .with(headers: fhir_headers)
          .to_return(status: 201, body: example_json)
        response = subject.create(FHIR::Patient, name: 'John')

        expect(response).to be_a FHIR::ClientReply
        expect(response.resource).to be_a FHIR::Patient
        expect(response.resource.id).to eq 'example'
      end
    end

    context 'with an invalid content' do
      it 'returns an exception object' do
        error_response = '{ "resourceType": "OperationOutcome", "issue": { "diagnostics": "Patient requires field \'name\' to be set." } }'
        stub_request(:post, "#{iss}/Patient")
          .with(headers: fhir_headers)
          .to_return(status: 500, body: error_response)
        response = subject.create(FHIR::Patient, {})

        expect(response).to be_a FHIR::ClientException
        expect(response.resource).to be_a FHIR::OperationOutcome
        expect(response.response.code).to eq 500
        expect(response.response.body).to eq error_response
      end
    end
  end

  context 'mime type methods' do
    context '#use_json!' do
      let(:expected_header) { { 'Accept' => 'application/fhir+json' } }

      it 'sets the accept header' do
        subject.use_json!
        expect(RestClient).to receive(:get).with(anything, hash_including(expected_header)).once
        subject.read(FHIR::Patient, example_patient_id)
      end
    end

    context '#use_xml!' do
      let(:expected_header) { { 'Accept' => 'application/fhir+xml' } }

      it 'sets the accept header' do
        subject.use_xml!
        expect(RestClient).to receive(:get).with(anything, hash_including(expected_header)).once
        subject.read(FHIR::Patient, example_patient_id)
      end
    end

    context '#use_format_param' do
      context 'false' do
        let(:expected_header) { { 'Accept' => 'application/fhir+json' } }

        it 'uses the accept header without parameter' do
          expect(RestClient)
            .to receive(:get)
            .with("#{iss}/Patient/#{example_patient_id}", hash_including(expected_header))
            .twice
          # The default is false
          subject.read(FHIR::Patient, example_patient_id)
          subject.use_format_param!(false)
          subject.read(FHIR::Patient, example_patient_id)
        end
      end

      context 'true' do
        let(:unexpected_header) { { 'Accept' => 'application/fhir+json' } }

        it 'removes the header and adds a query parameter' do
          expect(RestClient)
            .to receive(:get)
            .with("#{iss}/Patient/#{example_patient_id}?_format=json", hash_excluding(unexpected_header))
            .twice
          subject.use_format_param!
          subject.read(FHIR::Patient, example_patient_id)
          subject.use_format_param!(true)
          subject.read(FHIR::Patient, example_patient_id)
        end
      end
    end
  end

  context '#capability_statement' do
    let(:example_json) do
      {
        resourceType: resource_type,
        fhirVersion: fhir_version.to_s,
        format: accepted_formats
      }.to_json
    end

    context 'FHIR >= 1.8' do
      let(:resource_type) { 'CapabilityStatement' }
      let(:fhir_version) { 1.8 }
      let(:accepted_formats) { ['application/fhir+xml'] }

      it 'returns a valid capability statement' do
        stub_request(:get, "#{iss}/metadata")
          .to_return(body: example_json)
        expect(subject.capability_statement).to be_a FHIR::CapabilityStatement
        expect(subject.fhir_version).to eq fhir_version
        expect(subject.accept_type).to eq :xml
      end
    end

    context 'FHIR < 1.8' do
      let(:resource_type) { 'Conformance' }
      let(:fhir_version) { 1.6 }
      let(:accepted_formats) { ['application/xml+fhir'] }

      # TODO: Implement when multiple FHIR Versions are supported!
      it 'returns a valid conformance statement'
    end
  end
end

# FHIR::Client#get(resource_class, params)
# FHIR::Client#post(resource_class, params)
# FHIR::Client#put(resource_class, params)
# FHIR::Client#patch(resource_class, params)
# FHIR::Client#delete(resource_class, params)
