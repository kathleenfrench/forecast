require 'sinatra'
require './app.rb'

map "/favicon.ico" do
	    run Rack::File.new("./public/favicon.ico")
end

run Sinatra::Application
