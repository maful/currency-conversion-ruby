module CurrencyConversion
  # ExchangeRates
  class ExchangeRates
    # @return [Hash] The response body
    attr_reader :body

    # @return [Faraday::Response] The Faraday Response
    attr_reader :response

    def initialize(response)
      @response = response
      @body = response.body
    end

    def data
      body['data']
    end

    def meta
      body['meta']
    end

    def last_updated_at
      meta['last_updated_at']
    end
  end
end
