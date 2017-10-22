require 'sinatra'
require 'config_env'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  @api_key = ENV['API_KEY']
  erb :index
end
