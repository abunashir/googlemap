module Googlemap
  class Configuration
    attr_accessor :api_host, :api_key

    def initialize
      @api_host ||= "maps.googleapis.com"
    end

    def base_path
      ["maps", "api"].join("/")
    end
  end
end
