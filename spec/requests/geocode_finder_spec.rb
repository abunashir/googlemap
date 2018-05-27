require "spec_helper"

RSpec.describe "Finding Geo Cordinates" do
  it "retrives geocordinate for an address", api_call: true do
    address = "Düsseldorf, Germany"

    geocode = Googlemap::Geocode.find(address)
    dussldorf = geocode.results.first

    expect(geocode.status).to eq("OK")
    expect(dussldorf.formatted_address).to eq(address)
    expect(dussldorf.geometry.location.lng).to eq(6.7734556)
    expect(dussldorf.geometry.location.lat).to eq(51.2277411)
  end
end
