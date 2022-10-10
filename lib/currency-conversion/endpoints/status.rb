module CurrencyConversion
  # Status Endpoint
  class StatusEndpoint < Resource
    # Returns your current quota
    #
    # @return [Status]
    def retrieve
      Status.new get_request('status').body
    end
  end
end
