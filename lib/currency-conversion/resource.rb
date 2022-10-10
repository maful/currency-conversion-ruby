# frozen_string_literal: true

module CurrencyConversion
  # Resource
  class Resource
    # @return [Currency::Conversion::Client] Gets the Client instance
    attr_reader :client

    # Initialize a new resource
    #
    # @param client [Currency::Conversion::Client] The Client instance
    #
    # @return [Currency::Conversion::Resource]
    def initialize(client)
      @client = client
    end

    private

    def get_request(path, params: {})
      handle_response client.connection.get(path, params)
    end

    def handle_response(response)
      # TODO: Handle response based on status code
      response
    end
  end
end
