require "dotenv/load"
require "webmock/rspec"
require "bundler/setup"

require "googlemap"
require "googlemap/rspec"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Skip the actual API calls by default
  config.filter_run_excluding api_call: true

  # Allow the net_connection when we actually want to
  # perform an actual API reques
  #
  config.before :each, api_call: true do
    WebMock.allow_net_connect!
    Googlemap.configuration.api_host = "maps.googleapis.com"
  end

  # Set the client configuration
  config.before :all do
    Googlemap.configure do |googlemap_cofig|
      googlemap_cofig.api_host = "googlemaps.com"
      googlemap_cofig.api_key = ENV["GOOGLEMAP_API_KEY"] || "GOOGLEMAP_API_KEY"
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
