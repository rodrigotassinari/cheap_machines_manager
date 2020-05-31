require "test_helper"

describe StatusController do

  describe "#ping" do
    it "routes correctly" do
      _(root_path).must_equal('/')
      assert_recognizes({controller: 'status', action: 'ping', format: :json}, {path: '/', method: :get})

      _(ping_path).must_equal('/ping')
      assert_generates('/ping', {controller: 'status', action: 'ping', format: :json})
      assert_recognizes({controller: 'status', action: 'ping', format: :json}, {path: '/ping', method: :get})
    end
    it_requires_authentication do
      get ping_url
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      get ping_url, headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "returns 'pong' with valid authentication" do
        get ping_url, headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'pong')
      end
      it "returns 'pong' with valid authentication on the root path" do
        get root_url, headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'pong')
      end
    end
  end
  
  describe "#healthcheck" do
    it "routes correctly" do
      _(healthcheck_path).must_equal('/healthcheck')
      assert_generates('/healthcheck', {controller: 'status', action: 'healthcheck', format: :json})
      assert_recognizes({controller: 'status', action: 'healthcheck', format: :json}, {path: '/healthcheck', method: :get})
    end
    it "returns OK without authentication" do
      get healthcheck_url
      _(response.code).must_equal('200')
      _(JSON.parse(response.body)).must_equal('status' => 'OK')
    end
  end

end
