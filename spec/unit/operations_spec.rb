describe FHIR::Model do
  let(:iss) { 'http://fhir.example.com' }
  let(:client) { FHIR::Client.new(iss) }
  let(:fhir_headers) do
    { 'Accept' => 'application/fhir+json' }
  end

  let(:example_json) { File.read('./spec/fixtures/json/patient-example.json') }

  describe '.read' do
    it 'performs a GET with the ID' do
      id = '575577'
      stub_request(:get, "#{iss}/Patient/#{id}")
        .with(headers: fhir_headers)
        .to_return(body: example_json, status: 200)
      model = FHIR::Patient.read(id, client)
      expect(model).to be_a FHIR::Patient
    end
  end

  describe '.search' do
    let(:search_json) { File.read('./spec/fixtures/json/search-example.json') }

    it 'performs a GET with the search params' do
      stub_request(:get, "#{iss}/Patient?name=Chadwick")
        .with(headers: fhir_headers)
        .to_return(body: search_json, status: 200)
      models = FHIR::Patient.search({ name: 'Chadwick' }, client)
      expect(models).to be_a FHIR::Bundle
    end

    it 'performs a GET with nested search params', :skip do # I think this is wrong?
      stub_request(:get, "#{iss}/Patient?search[name]=Chadwick")
        .with(headers: fhir_headers)
        .to_return(body: search_json, status: 200)
      models = FHIR::Patient.search({ search: { name: 'Chadwick' } }, client)
      expect(models).to be_a FHIR::Bundle
    end
  end

  describe '.create' do
    it 'performs a POST with the params' do
      resource_hash = {
        id: '575557',
        name: [{
          given: ['Bob'],
          family: ['Jackson']
        }],
        resourceType: 'Patient'
      }
      patient = FHIR::Patient.new(resource_hash)

      stub_request(:post, "#{iss}/Patient")
        .with(headers: fhir_headers, body: resource_hash.to_json)
        .to_return(status: 201)
      model = FHIR::Patient.create(patient, client)
      expect(model).to be_a FHIR::Patient
    end
  end

  describe '#create' do
    let(:resource_hash) do
      {
        id: '575557',
        name: [{
          family: ['Jackson'],
          given: ['Bob']
        }],
        resourceType: 'Patient'
      }
    end

    let(:patient) { FHIR::Patient.new(resource_hash) }

    context 'with a client set on the model' do
      before do
        patient.client = client
      end

      context 'when the response body is empty' do
        it 'performs a POST with itself as params using the set client' do
          stub = stub_request(:post, "#{iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201)

          created_model = patient.create

          expect(stub).to have_been_requested
          expect(created_model).to eq patient
        end

        it 'performs a POST with itself as params using an override client' do
          other_iss = 'http://otherfhir.example.com'
          other_client = FHIR::Client.new(other_iss)
          stub = stub_request(:post, "#{other_iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201)

          created_model = patient.create(other_client)

          expect(stub).to have_been_requested
          expect(created_model).to eq patient
        end
      end

      context 'when the response body is present' do
        it 'performs a POST with itself as params using the set client' do
          stub = stub_request(:post, "#{iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201, body: resource_hash.to_json)

          created_model = patient.create

          expect(stub).to have_been_requested
          expect(created_model).not_to eq patient
          expect(created_model.client).to eq client
        end

        it 'performs a POST with itself as params using an override client' do
          other_iss = 'http://otherfhir.example.com'
          other_client = FHIR::Client.new(other_iss)
          stub = stub_request(:post, "#{other_iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201, body: resource_hash.to_json)

          created_model = patient.create(other_client)

          expect(stub).to have_been_requested
          expect(created_model).not_to eq patient
          expect(created_model.client).to eq other_client
        end
      end
    end

    context 'with no client set on the model' do
      context 'when response body is empty' do
        it 'performs a POST with itself as params when a client is passed' do
          stub = stub_request(:post, "#{iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201)

          created_model = patient.create(client)

          expect(stub).to have_been_requested
          expect(created_model).to eq patient
        end
      end

      context 'when response body is present' do
        it 'performs a POST with itself as params when a client is passed' do
          stub = stub_request(:post, "#{iss}/Patient")
            .with(headers: fhir_headers, body: resource_hash.to_json)
            .to_return(status: 201, body: resource_hash.to_json)

          created_model = patient.create(client)

          expect(stub).to have_been_requested
          expect(created_model).not_to eq patient
          expect(created_model.client).to eq client
        end
      end

      it 'fails when no client is passed' do
        stub = stub_request(:post, "#{iss}/Patient")
          .with(headers: fhir_headers, body: resource_hash.to_json)
          .to_return(status: 201)

        expect { patient.create }.to raise_error(FHIR::Operations::MissingClientError)

        expect(stub).not_to have_been_requested
      end
    end
  end

  describe '#client=' do
    let(:resource_hash) do
      {
        resourceType: 'MedicationAdministration',
        id: 'abc123',
        status: 'completed',
        medicationReference: {
          reference: 'Medication/a-medication'
        },
        patient: {
          reference: 'Patient/a-patient'
        },
        effectiveTimeDateTime: '2017-04-05T14:41:26.278Z-0500',
        dosage: {
          method: {
            coding: [
              {
                system: 'http://snomed.info/sct',
                code: '417924000'
              }
            ]
          }
        }
      }
    end

    let(:client) { FHIR::Client.new(iss) }
    let(:model) { FHIR::MedicationAdministration.new(resource_hash) }

    it 'sets its client' do
      model.client = client
      expect(model.client).to eq client
    end

    it 'sets the client on its attributes/children' do
      model.client = client

      expect(model.medication.client).to eq client
      expect(model.patient.client).to eq client
      expect(model.dosage.client).to eq client
      expect(model.dosage.local_method.client).to eq client
      expect(model.dosage.local_method.coding.first.client).to eq client
    end
  end
end

# FHIR::Patient.read(id, client)
# FHIR::Patient.search(params, client)
# FHIR::Patient.update
# FHIR::Patient.partial_update
# FHIR::Patient.conditional_update
# FHIR::Patient.vread
# .read_with_summary
# .resource_history
# .resource_history_as_of
# .resource_instance_history
# .resource_instance_history_as_of
# .create
# .conditional_create
# .all

# #vread
# #create
# #conditional_create
# #update
# #conditional_update
# #destroy
