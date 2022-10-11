# CurrencyAPI

[![Test](https://github.com/maful/currency-conversion-ruby/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/maful/currency-conversion-ruby/actions/workflows/test.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currency-conversion'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install currency-conversion

## Usage

Create a new client, grab the API key on [Currency Conversion API](https://currencyapi.com/) website.

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

### Latest Exchange Rates

```ruby
response = client.exchange_rates.latest(base_currency: 'USD', currencies: ['IDR', 'EUR'])
response.body
# => {"meta"=>{"last_updated_at"=>"2022-10-10T23:59:59Z"}, "data"=>{"EUR"=>{"code"=>"EUR", "value"=>1.029906}, "IDR"=>{"code"=>"IDR", "value"=>15350.189946}}}
response.meta
# => {"last_updated_at"=>"2022-10-10T23:59:59Z"}
response.last_updated_at
# => "2022-10-10T23:59:59Z"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maful/currency-conversion-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maful/currency-conversion-ruby/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Currency::Conversion project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maful/currency-conversion-ruby/blob/main/CODE_OF_CONDUCT.md).
