require 'redis'
require 'sinatra'
require_relative 'urlshortener'

### CONFIG AND STARTUP ###
set :bind, '0.0.0.0'
$SHORT_BASE_URL = "http://localhost:4567/"
$redis = Redis.new(:host => "localhost")

# Run when ENV['RACK_ENV'] == "test"
configure :test do
  require 'mock_redis'
  $redis = MockRedis.new
end

configure do
  $shortener = URLShortener.new($redis)
end

### PAGES ###

# Index page
get '/' do
  erb :index
end

# Redirection of a shorturl
get '/:shorturl' do
  @long_url = $shortener.retrieve_url(params['shorturl'])
  puts @long_url
  redirect @long_url
end

# Creating a new shorturl
post '/' do
  @short_url = $SHORT_BASE_URL + $shortener.store_url(params['longurl'])
  erb :index, :locals => {:shorturl => @short_url, :longurl => params['longurl']}
end
