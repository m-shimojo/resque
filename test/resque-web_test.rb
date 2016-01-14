require 'test_helper'
require 'rack/test'
require 'resque/server'

describe "Resque web server" do
  include Rack::Test::Methods

  def app
    Resque::Server.new
  end

  # Root path test
  describe "on GET to /" do
    before { get "/" }

    it "redirect to overview" do
      follow_redirect!
    end
  end

  # Global overview
  describe "on GET to /overview" do
    before { get "/overview" }

    it "should at least display 'queues'" do
      assert last_response.body.include?('Queues')
    end
  end

  # Working jobs
  describe "on GET to /working" do
    before { get "/working" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

  # Failed
  describe "on GET to /failed" do
    before { get "/failed" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

  # Stats
  describe "on GET to /stats/resque" do
    before { get "/stats/resque" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

  describe "on GET to /stats/redis" do
    before { get "/stats/redis" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

  describe "on GET to /stats/resque" do
    before { get "/stats/keys" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

  describe "also works with slash at the end" do
    before { get "/working/" }

    it "should respond with success" do
      assert last_response.ok?, last_response.errors
    end
  end

end
