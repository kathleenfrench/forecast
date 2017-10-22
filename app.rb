require 'sinatra'
require 'config_env'
require_relative 'models/weather.rb'
require 'uri'

ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  @cities = [
    "Brooklyn",
    "New York",
    "Dallas",
    "Los Angeles",
    "Paris",
    "London",
    "Tokyo",
    "Moscow",
    "San Francisco"
  ]

  @city = params[:city] || "Brooklyn"
  weather = Weather.new(@city)
  @temp = weather.temp
  erb :index
end
