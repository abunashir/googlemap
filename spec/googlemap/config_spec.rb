require "spec_helper"

RSpec.describe Googlemap::Config do
  describe ".configuration" do
    it "retrieves current client configuration" do
      api_host = "maps.google.com/api"

      Googlemap.configure do |googlemap_config|
        googlemap_config.api_host = api_host
      end

      config = Googlemap.configuration

      expect(config.api_host).to eq(api_host)
    end
  end
end
