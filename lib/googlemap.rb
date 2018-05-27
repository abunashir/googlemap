require "googlemap/version"
require "googlemap/request"
require "googlemap/geocode"

module Googlemap
  def self.root
    File.dirname(__dir__)
  end
end
