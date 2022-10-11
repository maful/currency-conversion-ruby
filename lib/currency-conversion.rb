# frozen_string_literal: true

require 'faraday'
require 'currency-conversion/version'

module CurrencyConversion
  autoload :Client, 'currency-conversion/client'
  autoload :Resource, 'currency-conversion/resource'
  autoload :Object, 'currency-conversion/object'

  autoload :StatusEndpoint, 'currency-conversion/endpoints/status'
  autoload :ExchangeRatesEndpoint, 'currency-conversion/endpoints/exchange_rates'

  autoload :Status, 'currency-conversion/objects/status'
  autoload :ExchangeRates, 'currency-conversion/objects/exchange_rates'
end
