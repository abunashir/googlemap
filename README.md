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

Don't! This just an experimental project for a specific purpose.

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

## License

The gem is available as open source under the terms of the [MIT License]

[MIT License]: http://opensource.org/licenses/MIT
[Google API console]: https://developers.google.com/maps/documentation/geocoding/get-api-key
