require "sawyer"
require "googlemap/config"

module Googlemap
  class Request
    # Initialize a Request
    #
    # @param http_method [Symbol] HTTP verb as sysmbol
    # @param endpoint [String] The relative API endpoint
    # @param data [Hash] Attributes / Options as a Hash
    #
    def initialize(http_method, endpoint, **data)
      @data = data
      @endpoint = endpoint
      @http_method = http_method
    end

    # Make a HTTP Request
    #
    # @param options [Hash] Additonal options hash
    # @return [Sawyer::Resource]
    #
    def request(options = {})
      options[:query] = { key: config.api_key }
      options[:query].merge!(extract_config_option(:query) || {})
      agent.call(http_method, api_endpoint, data, options).data
    end

    # Make a HTTP GET Request
    #
    # @param endpoint [String] The relative API endpoint
    # @param options [Hash] The additional query params
    # @return [Sawyer::Resource]
    #
    def self.get(endpoint, options = {})
      new(:get, endpoint, query: options).request
    end

    private

    attr_reader :client, :data, :http_method

    def config
      Googlemap.configuration
    end

    def googlemap_host
      config.api_host
    end

    def extract_config_option(key)
      if data.is_a?(Hash)
        data.delete(key.to_sym)
      end
    end

    def api_endpoint
      URI::HTTPS.build(
        host: googlemap_host,
        path: ["", config.base_path, @endpoint, "json"].join("/").squeeze("/"),
      )
    end

    def sawyer_options
      { links_parser: Sawyer::LinkParsers::Simple.new }
    end

    def agent
      @agent ||= Sawyer::Agent.new(googlemap_host, sawyer_options) do |http|
        http.headers[:accept] = "application/json"
        http.headers[:content_type] = "application/json"
      end
    end
  end
end
