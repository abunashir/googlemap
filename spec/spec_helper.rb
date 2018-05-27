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

  config.before :all do
    Googlemap.configure do |googlemap_cofig|
      googlemap_cofig.api_host = "googlemaps.com"
      googlemap_cofig.api_key = "YOUR-SECRET-API-KEY"
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
