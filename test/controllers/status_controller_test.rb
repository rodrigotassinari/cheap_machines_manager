require "test_helper"

describe StatusController do
  
  describe "#ping" do
    it "requires authentication" do
      get ping_url

      _(response.code).must_equal('401')
      _(response.headers['WWW-Authenticate']).must_equal('Token realm="CheapMachinesManager"')
      _(response.body).must_equal("HTTP Token: Access denied.\n") # TODO: return JSON
    end
    it "requires valid authentication" do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      get ping_url, headers: {'Authorization' => authorization}

      _(response.code).must_equal('401')
      _(response.headers['WWW-Authenticate']).must_equal('Token realm="CheapMachinesManager"')
      _(response.body).must_equal("HTTP Token: Access denied.\n") # TODO: return JSON
    end
    it "returns 'pong' with valid authentication" do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN'])
      get ping_url, headers: {'Authorization' => authorization}

      _(response.code).must_equal('200')
      _(JSON.parse(response.body)).must_equal('status' => 'pong')
    end
  end
  
  describe "#healthcheck" do
    it "returns OK without authentication" do
      get healthcheck_url

      _(response.code).must_equal('200')
      _(JSON.parse(response.body)).must_equal('status' => 'OK')
    end
  end

end
