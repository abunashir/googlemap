module Googlemap
  module FakeGooglemapApi
    private

    def stub_api_response(method, endpoint, filename:, status: 200)
      stub_http_request(method, googlemap_endpoint(endpoint)).
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

    def googlemap_endpoint(endpoint, output_format = "json")
      config = Googlemap.configuration
      api_path = [config.api_host, config.base_path, endpoint].join("/")

      @googlemap_endpoint ||= "https://#{api_path}/#{output_format}"
    end
  end
end
