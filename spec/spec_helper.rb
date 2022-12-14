# frozen_string_literal: true

require 'vcr'
require 'currency-conversion'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Custom settings for the client
  config.add_setting :default_client
  config.default_client = CurrencyConversion::Client.new(api_key: ENV['API_KEY'])
end
