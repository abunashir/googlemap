module Googlemap
  class Configuration
    attr_accessor :api_host

    def initialize
      @api_host ||= "maps.googleapis.com/maps/api"
    end
  end
end
