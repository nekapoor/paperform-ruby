module Paperform
  class Client
    BASE_URL = 'https://api.paperform.co/v1'
    attr_reader :token

    def initialize(token:, stubs: nil)
      @token = token
      @stubs = stubs
    end

    # GET /forms https://paperform.co/developer/api-v1-documentation/#tag/forms
    def forms(**params)
      handle_response connection.get('forms', params)
    end

    # GET https://paperform.co/developer/api-v1-documentation/#operation/Get%20Form
    def form(slug_or_id)
      handle_response connection.get("forms/#{slug_or_id}")
    end

    # GET https://paperform.co/developer/api-v1-documentation/#operation/Get%20Form%20Fields
    def form_fields(slug_or_id)
      handle_response connection.get("forms/#{slug_or_id}/fields")
    end

    # GET https://paperform.co/developer/api-v1-documentation/#operation/List%20Partial%20Submissions
    def partial_submissions(form:, **params)
      handle_response connection.get('partial-submissions', {form: form}.merge(params))
    end


    # GET https://paperform.co/developer/api-v1-documentation/#operation/Get%20Partial%20Submission
    def partial_submission(slug_or_id)
      handle_response connection.get("partial-submissions/#{slug_or_id}")
    end

    # GET https://paperform.co/developer/api-v1-documentation/#operation/List%20Submissions
    def submissions(form:, **params)
      handle_response(connection.get('submissions', {form: form}.merge(params)))
    end

    # GET https://paperform.co/developer/api-v1-documentation/#operation/Get%20Submission
    def submission(slug_or_id)
      handle_response connection.get("submissions/#{slug_or_id}")
    end

    private

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |faraday|
        faraday.headers['Authorization'] = "Bearer #{@token}"
        if @stubs
          faraday.adapter :test, @stubs
        end
      end
    end


    def handle_response(response)
      case response.status
      when 200
        response.body
      when 400
        raise Error, response.body
      when 401
        raise Error, response.body
      when 403
        raise Error, response.body
      when 404
        raise Error, response.body
      when 422
        raise Error, response.body
      when 500
        raise Error, "Possible Internal Server Error"
      end
      JSON.parse response.body
    end
  end
end
