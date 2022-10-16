# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConversion::ExchangeRatesEndpoint do
  let(:client) { RSpec.configuration.default_client }

  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  context 'with the latest exchange rates' do
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

  context 'with historical exchange rates' do
    let(:date) { Date.new(2022, 7, 7) }

    it 'default parameters' do
      VCR.use_cassette('endpoints/exchange_rates/historical_default') do
        response = client.exchange_rates.historical(date: date)

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(Date.parse(response.last_updated_at).strftime('%F')).to eq('2022-07-07')
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end

    it 'custom base currency' do
      VCR.use_cassette('endpoints/exchange_rates/historical_custom_base_currency') do
        response = client.exchange_rates.historical(date: date, base_currency: 'SGD')

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(Date.parse(response.last_updated_at).strftime('%F')).to eq('2022-07-07')
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end

    it 'custom currencies' do
      VCR.use_cassette('endpoints/exchange_rates/historical_custom_currencies') do
        response = client.exchange_rates
                         .historical(date: date, base_currency: 'SGD', currencies: %w[IDR MYR])

        expect(response.body).not_to be_empty
        expect(response.data).not_to be_empty
        expect(Date.parse(response.last_updated_at).strftime('%F')).to eq('2022-07-07')
        expect(response.data['IDR']['value']).not_to be_nil
        expect(response.data['MYR']['value']).not_to be_nil
        expect(response.response).to be_instance_of(Faraday::Response)
      end
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
