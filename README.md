# Googlemap

[![Build
Status](https://travis-ci.com/abunashir/googlemap.svg?branch=master)](https://travis-ci.com/abunashir/googlemap)

A simplest Ruby wrapper around Google Map API

## Installation

Add this line to your application's Gemfile:

```ruby
gem "googlemap", github: "abunashir/googlemap"
```

And then execute:

```
$ bundle install
```

## Usage

Don't use this! This is just an experimental project for a specific purpose.

### Configure

We need to setup Google Map API configuration before we can perform any request
throughout this client

First, obtain an API key form [Google API console], and once you have it then
you can configure the client by adding an initializer with the following code:

```ruby
Googlemap.configure do |googlemap_config|
  googlemap_config.api_key = "YOUR-SECRET-API-KEY"
end
```

### Geocode

#### Find geocode for address

```ruby
Googlemap::Geocode.find("valid_address")
```

## Testing

To run the whole test suite, please use the following command, by default it
won't make any actual API request.

```ruby
bin/rspec spec/
```

Once, you have something finalized and if you want to make sure that it is
actually working with the actual API or not then use the following command.

```ruby
bin/rpsec --tag api_call spec/
```

Note: You will need to setup your actual API key before running the last
command, and you can easily set it up by adding `GOOGLEMAP_API_KEY` in your
environment variables.

## License

The gem is available as open source under the terms of the [MIT License]

[MIT License]: http://opensource.org/licenses/MIT
[Google API console]: https://developers.google.com/maps/documentation/geocoding/get-api-key
