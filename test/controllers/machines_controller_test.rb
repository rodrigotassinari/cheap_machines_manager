require "test_helper"

describe MachinesController do

  describe "#create" do
    it "routes correctly" do
      _(machines_path).must_equal('/machines')
      assert_generates('/machines', {controller: 'machines', action: 'create', format: :json})
      assert_recognizes({controller: 'machines', action: 'create', format: :json}, {path: '/machines', method: :post})
    end
    it_requires_authentication do
      post machines_url
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      post machines_url, headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        post machines_url, headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#destroy" do
    it "routes correctly" do
      _(machine_path(id: 'foobar')).must_equal('/machines/foobar')
      assert_generates('/machines/foobar', {controller: 'machines', action: 'destroy', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'destroy', id: 'foobar', format: :json}, {path: '/machines/foobar', method: :delete})
    end
    it_requires_authentication do
      delete machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      delete machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        delete machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#show" do
    it "routes correctly" do
      _(machine_path(id: 'foobar')).must_equal('/machines/foobar')
      assert_generates('/machines/foobar', {controller: 'machines', action: 'show', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'show', id: 'foobar', format: :json}, {path: '/machines/foobar', method: :get})
    end
    it_requires_authentication do
      get machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      get machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        get machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#stop" do
    it "routes correctly" do
      _(stop_machine_path(id: 'foobar')).must_equal('/machines/foobar/stop')
      assert_generates('/machines/foobar/stop', {controller: 'machines', action: 'stop', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'stop', id: 'foobar', format: :json}, {path: '/machines/foobar/stop', method: :put})
    end
    it_requires_authentication do
      put stop_machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      put stop_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        put stop_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#start" do
    it "routes correctly" do
      _(start_machine_path(id: 'foobar')).must_equal('/machines/foobar/start')
      assert_generates('/machines/foobar/start', {controller: 'machines', action: 'start', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'start', id: 'foobar', format: :json}, {path: '/machines/foobar/start', method: :put})
    end
    it_requires_authentication do
      put start_machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      put start_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        put start_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#resize" do
    it "routes correctly" do
      _(resize_machine_path(id: 'foobar')).must_equal('/machines/foobar/resize')
      assert_generates('/machines/foobar/resize', {controller: 'machines', action: 'resize', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'resize', id: 'foobar', format: :json}, {path: '/machines/foobar/resize', method: :post})
    end
    it_requires_authentication do
      post resize_machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      post resize_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        post resize_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#migrate" do
    it "routes correctly" do
      _(migrate_machine_path(id: 'foobar')).must_equal('/machines/foobar/migrate')
      assert_generates('/machines/foobar/migrate', {controller: 'machines', action: 'migrate', id: 'foobar', format: :json})
      assert_recognizes({controller: 'machines', action: 'migrate', id: 'foobar', format: :json}, {path: '/machines/foobar/migrate', method: :post})
    end
    it_requires_authentication do
      post migrate_machine_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      post migrate_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        post migrate_machine_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

end
