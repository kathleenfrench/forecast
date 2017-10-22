require 'sinatra'
require 'config_env'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  resp = HTTParty.get(
    "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=#{ENV['API_KEY']}"
  )
  data = JSON.parse(resp.body)
  # convert temp from kelvin to Farenheit
  @temp = data['main']['temp'] * 9 / 5 - 459.67
  erb :index
end
