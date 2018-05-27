module Googlemap
  class Geocode
    def self.find(address)
      Request.get("geocode", address: address)
    end
  end
end
