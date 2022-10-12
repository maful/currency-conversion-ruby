# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module CurrencyConversion
  # Currencies Endpoint
  class CurrenciesEndpoint < Resource
    # Returns all supported currencies
    #
    # @param currencies [Array<String>] The currency codes which you want to get.
    #   By default all available currencies will be shown.
    #
    # @return [Currencies]
    def retrieve(currencies: nil)
      params = {}
      params[:currencies] = currencies.join(',') if currencies.present?
      Currencies.new get_request('currencies', params: params)
    end
  end
end
