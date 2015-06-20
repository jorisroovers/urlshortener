require 'redis'
require 'sinatra'
require_relative 'urlshortener'

set :bind, '0.0.0.0'
$SHORT_BASE_URL = "http://localhost:4567/"
$redis = Redis.new(:host => "localhost")
$shortener = URLShortener.new($redis)

# Index page
get '/' do
  erb :index
end

get '/:shorturl' do
  @long_url = $shortener.retrieve_url(params['shorturl'])
  puts @long_url
  redirect @long_url
end

post '/' do
  @short_url = $SHORT_BASE_URL + $shortener.store_url(params['longurl'])
  erb :index, :locals => {:shorturl => @short_url, :longurl => params['longurl']}
end
