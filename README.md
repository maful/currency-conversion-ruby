# CurrencyAPI

[![Test](https://github.com/maful/currency-conversion-ruby/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/maful/currency-conversion-ruby/actions/workflows/test.yml)
[![Gem Version](https://badge.fury.io/rb/currency-conversion-api.svg)](https://badge.fury.io/rb/currency-conversion-api)

> [Libur.run](https://github.com/maful/libur.run) - Empower Your HR with Next-Gen Open Source Self-Serve Platform

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currency-conversion-api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install currency-conversion-api

## Usage

Create a new client, grab the API key on [Currency Conversion API](https://currencyapi.com/) website.

[API Documentation](https://rubydoc.info/gems/currency-conversion-api)

```ruby
client = CurrencyConversion::Client.new(api_key: ENV['API_KEY'])
```

## Endpoints

### Status

```ruby
response = client.status.retrieve
# => #<CurrencyConversion::Status quotas=#<OpenStruct month=#<OpenStruct total=300, used=1, remaining=299>, grace=#<OpenStruct ...
quotas = response.quotas
# => #<OpenStruct month=#<OpenStruct total=300, used=1, remaining=299>, grace=#<OpenStruct total=0, used=0, remaining=0>>
quotas.month.total
# => 300
```

### List available currencies

```ruby
response = client.currencies.retrieve
response.data
# =>
# {"AED"=>
#   {"symbol"=>"AED",
#    "name"=>"United Arab Emirates Dirham",
#    "symbol_native"=>"د.إ",
#    "decimal_digits"=>2,
#    "rounding"=>0,
#    "code"=>"AED",
#    "name_plural"=>"UAE dirhams"},
# {...}
# }

# retrieve specific currencies
response = client.currencies.retrieve(currencies: ['IDR', 'SGD'])
response.data
# =>
# {"IDR"=>
#   {"symbol"=>"Rp",
#    "name"=>"Indonesian Rupiah",
#    "symbol_native"=>"Rp",
#    "decimal_digits"=>0,
#    "rounding"=>0,
#    "code"=>"IDR",
#    "name_plural"=>"Indonesian rupiahs"},
#  "SGD"=>
#   {"symbol"=>"S$",
#    "name"=>"Singapore Dollar",
#    "symbol_native"=>"$",
#    "decimal_digits"=>2,
#    "rounding"=>0,
#    "code"=>"SGD",
#    "name_plural"=>"Singapore dollars"}}
```

### Exchange Rates

#### Convert Exchange Rates

```ruby
response = client.exchange_rates.convert(value: 10, currencies: %w[IDR EUR], date: Date.new(2022, 10, 11))
response.data
```

#### Latest Exchange Rates

```ruby
response = client.exchange_rates.latest(base_currency: 'USD', currencies: %w[IDR EUR])
response.body
# => {"meta"=>{"last_updated_at"=>"2022-10-10T23:59:59Z"}, "data"=>{"EUR"=>{"code"=>"EUR", "value"=>1.029906}, "IDR"=>{"code"=>"IDR", "value"=>15350.189946}}}
response.meta
# => {"last_updated_at"=>"2022-10-10T23:59:59Z"}
response.last_updated_at
# => "2022-10-10T23:59:59Z"
```

#### Historical Exchange Rates

```ruby
response = client.exchange_rates.historical(date: Date.new(2022, 6, 6), currencies: %w[SGD IDR])
response.data
# => {"IDR"=>{"code"=>"IDR", "value"=>14438.00731}, "SGD"=>{"code"=>"SGD", "value"=>1.37705}}
response.last_updated_at
# => "2022-06-06T23:59:59Z"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maful/currency-conversion-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maful/currency-conversion-ruby/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Currency::Conversion project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maful/currency-conversion-ruby/blob/main/CODE_OF_CONDUCT.md).
