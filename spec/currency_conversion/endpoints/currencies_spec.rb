# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConversion::CurrenciesEndpoint do
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  context 'with list available currencies' do
    let(:client) { RSpec.configuration.default_client }

    it 'default parameters' do
      VCR.use_cassette('endpoints/currencies/default') do
        response = client.currencies.retrieve

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end

    it 'returns specific currencies' do
      VCR.use_cassette('endpoints/currencies/specific_currencies') do
        response = client.currencies.retrieve(currencies: %w[IDR SGD])

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(response.data['IDR']).not_to be_empty
        expect(response.data['SGD']).not_to be_empty
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
