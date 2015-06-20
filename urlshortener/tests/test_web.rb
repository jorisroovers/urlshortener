ENV['RACK_ENV'] = 'test'

require_relative '../web'
require 'test/unit'
require 'rack/test'

class WebTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_post_url
    $redis = MockRedis.new
    post "/", :longurl => "foobar"
    assert last_response.body.include?('foobar')
  end

end