describe FHIR::Conformance do
  let(:example_json) { JSON.parse(File.read('./spec/fixtures/json/conformance-example.json')) }
  subject { FHIR::Conformance.new(example_json) }

  let(:expected_oauth_urls) do
    {
      authorize_url: 'https://fhir.example.com/fhir/openid-connect-server-webapp/authorize',
      token_url: 'https://fhir.example.com/fhir/openid-connect-server-webapp/token'
    }
  end

  context '#oauth2_urls' do
    it 'returns the first auth URLs' do
      subject.rest << FHIR::Conformance::Rest.new
      subject.rest << FHIR::Conformance::Rest.new(security: security_hash)
      subject.oauth2_urls
      expect(subject.oauth2_urls).to eq expected_oauth_urls
    end
  end

  describe FHIR::Conformance::Rest::Security do
    subject { FHIR::Conformance::Rest::Security.new(security_hash) }

    context '#oauth2_urls' do
      it 'returns the URLs and stuff' do
        expect(subject.oauth2_urls).to eq(expected_oauth_urls)
      end
    end
  end

  def security_hash(token_url: nil, authorize_url: nil)
    {
      extension: [{
        url: "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris",
        extension: [{
          url: "token",
          valueUri: (token_url || "https://fhir.example.com/fhir/openid-connect-server-webapp/token")
        }, {
          url: "authorize",
          valueUri: (authorize_url || "https://fhir.example.com/fhir/openid-connect-server-webapp/authorize")
        }]
      }],
      cors: true,
      service: [{
        coding: [{
          system: "http://hl7.org/fhir/restful-security-service",
          code: "SMART-on-FHIR",
          display: "SMART-on-FHIR"
        }],
        text: "OAuth2 using SMART-on-FHIR profile (see http://docs.smarthealthit.org)"
      }]
    }
  end
end
