require "spec_helper"

RSpec.describe Googlemap::Config do
  describe ".configuration" do
    it "retrieves current client configuration" do
      api_host = "maps.google.com/api"
      api_key = "super-secret-google-map-key"

      Googlemap.configure do |googlemap_config|
        googlemap_config.api_key = api_key
        googlemap_config.api_host = api_host
      end

      config = Googlemap.configuration

      expect(config.api_key).to eq(api_key)
      expect(config.api_host).to eq(api_host)
    end
  end
end
