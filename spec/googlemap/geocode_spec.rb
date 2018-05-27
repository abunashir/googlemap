require "spec_helper"

RSpec.describe Googlemap::Geocode do
  describe "find" do
    context "with valid address" do
      it "retrieves the geo cordinates" do
        address = "Düsseldorf, Germany"
        stub_geocoding_find_api(address)

        geocode = Googlemap::Geocode.find(address)
        dussldorf = geocode.results.first

        expect(dussldorf.formatted_address).to eq(address)
        expect(dussldorf.geometry.location.lng).to eq(6.7734556)
        expect(dussldorf.geometry.location.lat).to eq(51.2277411)
      end
    end

    context "with invalid address" do
      it "returns the empty results with status" do
        address = "this is an invalid address"

        stub_geocoding_find_api(address, "invalid")
        geocode = Googlemap::Geocode.find(address)

        expect(geocode.results).to eq([])
        expect(geocode.status).to eq("ZERO_RESULTS")
      end
    end
  end
end
