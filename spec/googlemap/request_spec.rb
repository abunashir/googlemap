require "spec_helper"

RSpec.describe Googlemap::Request do
  describe ".get" do
    it "retrieve the resource via a http :get" do
      endpoint = "ping"

      stub_ribose_ping_api_request
      response = Googlemap::Request.get(endpoint)

      expect(response.data).to eq("Pong!")
    end
  end

  def stub_ribose_ping_api_request(method = :get)
    stub_api_response(method, "ping", filename: "ping")
  end
end
