require "active_support/core_ext/object/blank"

module CurrencyConversion
  # Latest Exchange Rates Endpoint
  class ExchangeRatesEndpoint < Resource
    # Returns the latest exchange rates
    #
    # @param base_currency [String] The base currency to which all results are behaving relative to
    # @param currencies [Array<String>] An aray of string of currency codes which you want to get.
    #   Default all currencies will be shown.
    #
    # @return [ExchangeRates]
    def latest(base_currency: 'USD', currencies: nil)
      params = { base_currency: base_currency }
      params[:currencies] = currencies.join(',') if currencies.present?
      ExchangeRates.new get_request('latest', params:)
    end
  end
end
