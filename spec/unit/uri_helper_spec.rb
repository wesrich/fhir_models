describe FHIR::URIHelper do
  let(:iss) { 'http://fhir.example.com' }
  let(:client) { FHIR::Client.new(iss) }
  let(:uri) { client.resource_url(FHIR::Patient, query_options).to_s }

  context 'when iss has a trailing slash' do
    let(:iss_with_trailing_slash) { "#{iss}/" }
    let(:client) { FHIR::Client.new(iss_with_trailing_slash) }
    let(:query_options) { { id: 1234 } }

    it 'produces a valid URI' do
      expect(uri).to eq "#{iss}/Patient/1234"
    end
  end

  context 'default param handler' do
    let(:query_options) { { name: 'John', _count: 1 } }
    it 'can handle default parameters' do
      expect(uri).to eq "#{iss}/Patient?_count=1&name=John"
    end
  end

  context '$validate' do
    let(:query_options) { { id: '1234', validate: true } }

    it 'adds $validate to the URI' do
      expect(uri).to eq "#{iss}/Patient/1234/$validate"
    end
  end

  context '_search' do
    let(:query_options) { { search: search_options } }
    let(:search_options) { { parameters: { name: 'John' } } }

    context 'flag' do
      it 'appends _search to the URI' do
        search_options[:flag] = true
        expect(uri).to eq "#{iss}/Patient/_search?name=John"
      end
    end

    context 'compartment' do
      it 'appends Compartment/ID to the URI' do
        search_options[:compartment] = 'Location/AF1234'
        expect(uri).to eq "#{iss}/Location/AF1234/Patient?name=John"
        search_options[:compartment] = { 'Location' => 'AF1234' }
      end
    end

    context 'parameters' do
      it 'properly parses params[:search][:parameters]' do
        expect(uri).to eq "#{iss}/Patient?name=John"
      end
    end
  end

  context '_history' do
    let(:query_options) { { history: history_options } }
    let(:history_options) { {} }

    context 'broad history lookup' do
      it 'appends _history to the URI'

      it 'appends _history to a Patient search' do
        expect(uri).to eq "#{iss}/Patient/_history"
      end
    end

    context 'resource history' do
      let(:query_options) { { id: '1234', history: history_options } }

      it 'appends _history to a Patient resource' do
        expect(uri).to eq "#{iss}/Patient/1234/_history"
      end

      context 'with a history ID' do
        let(:history_options) { { id: '5' } }

        it 'appends _history/VID to a Patient resource' do
          expect(uri).to eq "#{iss}/Patient/1234/_history/5"
        end
      end
    end

    context 'old functionality' do
      context 'count' do
        let(:history_options) { { count: 5 } }

        it 'adds an _count parameter' do
          expect(uri).to eq "#{iss}/Patient/_history?_count=5"
        end

        context 'when already provided a count option' do
          let(:query_options) { { _count: 2, history: history_options } }

          it 'now discards the _history count' do
            expect(uri).to eq "#{iss}/Patient/_history?_count=2"
          end
        end
      end

      context 'since' do
        let(:history_options) { { since: Date.parse('12/12/2017') } }

        it 'adds an _since parameter' do
          expect(uri).to eq "#{iss}/Patient/_history?_since=2017-12-12"
        end

        context 'when already provided a since option' do
          let(:query_options) { { _since: Date.parse('3/3/2013'), history: history_options } }

          it 'now discards the _history since date' do
            expect(uri).to eq "#{iss}/Patient/_history?_since=2013-03-03"
          end
        end
      end
    end
  end

  context '_summary' do
    [true, false, 'text', 'data', 'count'].each do |value|
      context "with value #{value}" do
        let(:query_options) { { summary: value } }

        it "appends _summary=#{value}" do
          expect(uri).to eq "#{iss}/Patient?_summary=#{value}"
        end
      end
    end
  end

  context '_format' do
    let(:query_options) { { format: 'json' } }

    context 'with use_format_param=true' do
      it 'uses the _format param' do
        client.use_format_param!
        expect(uri).to eq "#{iss}/Patient?_format=json"
      end
    end

    context 'with use_format_param=false' do
      it 'does not use the _format param' do
        client.use_format_param!(false)
        expect(uri).to eq "#{iss}/Patient"
      end
    end
  end
end
