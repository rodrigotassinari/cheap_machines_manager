require "test_helper"

describe ProjectsController do

  describe "#create" do
    it "routes correctly" do
      _(projects_path).must_equal('/projects')
      assert_generates('/projects', {controller: 'projects', action: 'create', format: :json})
      assert_recognizes({controller: 'projects', action: 'create', format: :json}, {path: '/projects', method: :post})
    end
    it_requires_authentication do
      post projects_url
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      post projects_url, headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        post projects_url, headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#destroy" do
    it "routes correctly" do
      _(project_path(id: 'foobar')).must_equal('/projects/foobar')
      assert_generates('/projects/foobar', {controller: 'projects', action: 'destroy', id: 'foobar', format: :json})
      assert_recognizes({controller: 'projects', action: 'destroy', id: 'foobar', format: :json}, {path: '/projects/foobar', method: :delete})
    end
    it_requires_authentication do
      delete project_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      delete project_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        delete project_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#show" do
    it "routes correctly" do
      _(project_path(id: 'foobar')).must_equal('/projects/foobar')
      assert_generates('/projects/foobar', {controller: 'projects', action: 'show', id: 'foobar', format: :json})
      assert_recognizes({controller: 'projects', action: 'show', id: 'foobar', format: :json}, {path: '/projects/foobar', method: :get})
    end
    it_requires_authentication do
      get project_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      get project_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        get project_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#machines" do
    it "routes correctly" do
      _(machines_project_path(id: 'foobar')).must_equal('/projects/foobar/machines')
      assert_generates('/projects/foobar/machines', {controller: 'projects', action: 'machines', id: 'foobar', format: :json})
      assert_recognizes({controller: 'projects', action: 'machines', id: 'foobar', format: :json}, {path: '/projects/foobar/machines', method: :get})
    end
    it_requires_authentication do
      get machines_project_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      get machines_project_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        get machines_project_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

  describe "#access_rules" do
    it "routes correctly" do
      _(access_rules_project_path(id: 'foobar')).must_equal('/projects/foobar/access_rules')
      assert_generates('/projects/foobar/access_rules', {controller: 'projects', action: 'access_rules', id: 'foobar', format: :json})
      assert_recognizes({controller: 'projects', action: 'access_rules', id: 'foobar', format: :json}, {path: '/projects/foobar/access_rules', method: :put})
    end
    it_requires_authentication do
      put access_rules_project_url(id: 'foobar')
    end
    it_requires_valid_authentication do
      authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      put access_rules_project_url(id: 'foobar'), headers: {'Authorization' => authorization}
    end
    describe "when authenticated" do
      let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(ENV['API_TOKEN']) }
      it "is not done yet" do
        put access_rules_project_url(id: 'foobar'), headers: {'Authorization' => authorization}
        _(response.code).must_equal('200')
        _(JSON.parse(response.body)).must_equal('status' => 'TODO')
      end
    end
  end

end
