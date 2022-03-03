$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "paperform"

require "minitest/autorun"
require "faraday"

class Minitest::Test
  def stub_get_request(path, response:)
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/v1/#{path}") do |env|
        [200, {'Content-Type': "application/json"}, response]
      end
    end
  end
end
