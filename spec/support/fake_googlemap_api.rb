module Googlemap
  module FakeGooglemapApi
    def stub_geocoding_find_api(address, fixture_file = "geocode")
      stub_api_response(
        :get, "geocode", data: { address: address }, filename: fixture_file
      )
    end

    private

    def stub_api_response(method, endpoint, filename:, status: 200, data: {})
      stub_http_request(method, googlemap_endpoint(endpoint, data)).
        to_return(response_with(filename: filename, status: status))
    end

    def response_with(filename:, status:)
      {
        status: status,
        body: googlemap_fixture(filename),
        headers: { content_type: "application/json" },
      }
    end

    def googlemap_fixture(filename)
      filename = [filename, "json"].join(".")
      file_path = File.join(Googlemap.root, "spec", "fixtures", filename)

      File.read(File.expand_path(file_path, __FILE__))
    end

    def build_gogole_query_params(data_params = {})
      data_params[:key] = Googlemap.configuration.api_key
      data_params.map { |key, value| "#{key}=#{value}" }.join("&")
    end

    def googlemap_endpoint(endpoint, data = {}, format = "json")
      config = Googlemap.configuration
      query_params = build_gogole_query_params(data)
      api_path = [config.api_host, config.base_path, endpoint].join("/")

      @googlemap_endpoint ||= "https://#{api_path}/#{format}?#{query_params}"
    end
  end
end
