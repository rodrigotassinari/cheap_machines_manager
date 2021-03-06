if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    # https://github.com/colszowka/simplecov#profiles
    # add_filter '/test/'
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/rails'
require 'minispec-metadata'
require 'vcr'
require 'minitest-vcr'
require 'webmock'
require 'mocha/minitest'
require 'timecop'

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

# turn on safe mode, only calls passing a block are allowed
Timecop.safe_mode = true

VCR.configure do |config|
  config.default_cassette_options = {record: :once, record_on_error: false}
  config.cassette_library_dir = 'test/fixtures/cassettes'
  config.hook_into :webmock
end
MinitestVcr::Spec.configure!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all # FIXME: `<class:TestCase>': undefined method `fixtures' for ActiveSupport::TestCase:Class (NoMethodError)

  # Add more helper methods to be used by all tests here...
  def self.it_requires_authentication(&block)
    it "requires token authentication" do
      instance_exec(&block)
      _(response.code).must_equal('401')
      _(response.headers['WWW-Authenticate']).must_equal('Token realm="CheapMachinesManager"')
      _(response.body).must_equal("HTTP Token: Access denied.\n") # TODO: return JSON
    end
  end

  def self.it_requires_valid_authentication(&block)
    it "requires valid token authentication" do
      # authorization = ActionController::HttpAuthentication::Token.encode_credentials('wrong token')
      instance_exec(&block)
      _(response.code).must_equal('401')
      _(response.headers['WWW-Authenticate']).must_equal('Token realm="CheapMachinesManager"')
      _(response.body).must_equal("HTTP Token: Access denied.\n") # TODO: return JSON
    end
  end
end
