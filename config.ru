require 'rubygems'
require 'bundler'
Bundler.setup :default
require 'sinatra/base'
require 'sinatra/partial'
require 'sprockets'

require './app'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/fonts'
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/images'

  run environment
end

map '/' do
  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  run Sinatra::Application
end
