require "test_helper"

class ClientTest < MiniTest::Test
  def test_initialize
    client = Paperform::Client.new(token: "token")
    assert_equal "token", client.token
  end

  def test_forms
    client = setup_stub("forms", "test/fixtures/forms.json")
    assert_equal "ok", client.forms["status"]
  end

  def test_form
    client = setup_stub("forms/123", "test/fixtures/form.json")
    assert_equal "ok", client.form(123)["status"]
  end

  def test_form_fields
    client = setup_stub("forms/123/fields", "test/fixtures/form_fields.json")
    assert_equal "ok", client.form_fields(123)["status"]
  end

  def test_partial_submissions
    client = setup_stub("partial-submissions", "test/fixtures/partial_submissions.json")
    assert_equal "ok", client.partial_submissions["status"]
  end

  def test_partial_submission
    client = setup_stub("partial-submissions/123", "test/fixtures/partial_submission.json")
    assert_equal "ok", client.partial_submission(123)["status"]
  end

  def test_submissions
    client = setup_stub("submissions", "test/fixtures/submissions.json")
    assert_equal "ok", client.submissions(form: "46af4ef5-2c18-4098-9bc5-c048fb90b843")["status"]
  end

  def test_submission
    client = setup_stub("submissions/123", "test/fixtures/submission.json")
    assert_equal "ok", client.submission(123)["status"]
  end

  private
  
  def setup_stub(url, fixture)
    stubs = stub_get_request(url, response: File.read(fixture))
    client = Paperform::Client.new(token: "token", stubs: stubs)
  end



end
