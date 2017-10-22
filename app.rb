require 'sinatra'
require 'config_env'
require_relative 'models/weather.rb'
require 'uri'
require 'json'
require 'sinatra/json'

ConfigEnv.init("#{__dir__}/config/env.rb")
REDIS = Redis.new(url: ENV['REDIS_URL'])

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
  @icons = weather.icons
  erb :index
end

get '/favicon.ico' do
  halt 404
end
