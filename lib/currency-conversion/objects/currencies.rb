# frozen_string_literal: true

module CurrencyConversion
  # Currencies
  class Currencies
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
  end
end
