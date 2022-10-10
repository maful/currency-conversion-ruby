# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConversion::Client do
  let(:client) { described_class.new(api_key: 'api_key') }

  it 'returns api_key' do
    expect(client.api_key).to eq('api_key')
  end

  it 'returns default adapter' do
    expect(client.adapter).to eq(Faraday.default_adapter)
  end

  it 'returns default connection' do
    expect(client.connection).to be_instance_of(Faraday::Connection)
  end
end
