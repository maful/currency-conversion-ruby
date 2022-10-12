# frozen_string_literal: true

module CurrencyConversion
  # Client
  class Client
    # @return [String] Default API endpoint
    BASE_URL = 'https://api.currencyapi.com'

    # @return [String] API Version
    API_VERSION = 'v3'

    # @return [String] API Key
    attr_reader :api_key

    # @return [Symbol] Gets the Symbol key identifying a default Adapter to use
    attr_reader :adapter

    # Initialize a new client
    #
    # @param api_key [String] API Key
    # @param adapter [Symbol] Faraday Adapter
    #
    # @return [Currency::Conversion::Client]
    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    # Status Endpoint instance
    #
    # @return [StatusEndpoint]
    def status
      StatusEndpoint.new(self)
    end

    # Currencies Endpoint instance
    #
    # @return [CurrenciesEndpoint]
    def currencies
      CurrenciesEndpoint.new(self)
    end

    # Exchange Rates Endpoint instance
    #
    # @return [ExchangeRatesEndpoint]
    def exchange_rates
      ExchangeRatesEndpoint.new(self)
    end

    # Initializes a new Faraday connection
    #
    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new(headers: default_headers) do |conn|
        conn.url_prefix = connection_url
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    private

    def connection_url
      URI.join(BASE_URL, API_VERSION).to_s
    end

    def default_headers
      { 'apikey' => api_key, 'User-Agent' => user_agent }
    end

    def user_agent
      @user_agent ||= "currency-conversion/#{CurrencyConversion::VERSION}"
    end
  end
end
