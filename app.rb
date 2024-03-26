require 'bundler'
Bundler.setup :default

require 'sinatra'



get "/" do
  erb :index
end
