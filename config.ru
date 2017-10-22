require 'sinatra'
require './app.rb'

use Rack::Static, :urls=>["/favicon.ico"]
run Sinatra::Application
