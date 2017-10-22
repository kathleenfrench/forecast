require 'sinatra'
require './app.rb'

use Rack::Static, :urls => ['/favicon.ico'], :root => 'public'
4

run Sinatra::Application
