# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module CurrencyConversion
  # Exchange Rates Endpoint
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
      ExchangeRates.new get_request('latest', params: params)
    end

    # Returns calculated values for today or any given date for all currencies.
    #
    # @param value [String] The value you want to convert
    # @param base_currency [String] The base currency to which all results are behaving relative to
    # @param currencies [Array<String>] An aray of string of currency codes which you want to get.
    #   Default all currencies will be shown
    # @param date [Date] Date to retrieve historical rates from
    #
    # @return [ExchangeRates]
    def convert(value:, base_currency: 'USD', currencies: nil, date: nil)
      params = { base_currency: base_currency, value: value }
      params[:date] = date.strftime('%F') if date.is_a?(Date) || date.is_a?(Time)
      params[:currencies] = currencies.join(',') if currencies.present?
      ExchangeRates.new get_request('convert', params: params)
    end

    # Returns exchange rates for a given time range.
    #
    # @param date [Date] Date to retrieve historical rates from
    # @param base_currency [String] The base currency to which all results are behaving relative to
    # @param currencies [Array<String>] An aray of string of currency codes which you want to get.
    #   Default all currencies will be shown
    #
    # @return [ExchangeRates]
    def historical(date:, base_currency: 'USD', currencies: nil)
      params = { date: date.strftime('%F'), base_currency: base_currency }
      params[:currencies] = currencies.join(',') if currencies.present?
      ExchangeRates.new get_request('historical', params: params)
    end
  end
end
