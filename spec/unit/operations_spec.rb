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
