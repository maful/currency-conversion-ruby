# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConversion::ExchangeRatesEndpoint do
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  context 'with the latest exchange rates' do
    let(:client) { RSpec.configuration.default_client }

    it 'default parameters' do
      VCR.use_cassette('endpoints/exchange_rates/latest_default') do
        response = client.exchange_rates.latest

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(response.data['IDR']['value']).not_to be_nil
        expect(response.data['USD']['value']).to eq(1)
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end

    it 'custom base currency' do
      VCR.use_cassette('endpoints/exchange_rates/latest_base_currency') do
        response = client.exchange_rates.latest(base_currency: 'SGD')

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(response.data['SGD']['value']).to eq(1)
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end

    it 'custom retrieval currencies' do
      VCR.use_cassette('endpoints/exchange_rates/latest_retrieval_currencies') do
        response = client.exchange_rates.latest(currencies: %w[IDR SGD])

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(response.data['IDR']['value']).not_to be_nil
        expect(response.data['SGD']['value']).not_to be_nil
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
