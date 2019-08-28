module Paperform
  class PartialSubmission
    attr_reader :token

    BASE_URL = 'https://api.paperform.co/v1/partial-submissions'

    def initialize(token)
      @token = token
    end

    def find(id)
      params = { id: id }

      response = Curl.get(BASE_URL, params) do |http|
        http.headers['Authorization'] = "Bearer #{token}"
      end

      response.body
    end

    def list(form_id, options = nil)
      params = { form: form_id }
      params.merge!(options) if options

      response = Curl.get(BASE_URL, params) do |http|
        http.headers['Authorization'] = "Bearer #{token}"
      end

      response.body
    end
  end
end
