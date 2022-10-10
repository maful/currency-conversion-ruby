# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConversion::StatusEndpoint do
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  it 'returns quotas of the month' do
    VCR.use_cassette('endpoints/status') do
      client = RSpec.configuration.default_client
      response = client.status.retrieve

      quotas = response.quotas
      expect(quotas.month.total).to eq(300)
      expect(quotas.month.used).to eq(1)
      expect(quotas.month.remaining).to eq(299)
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
