require 'bundler'
Bundler.setup :default

require 'sinatra'

disable :protection

get '/up' do
  'OK'
end

get '/' do
  erb :index
end
