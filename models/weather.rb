require 'httparty'
require 'uri'

class Weather
  def initialize(city)
    @city = city
  end

  def weather_data
    if ! REDIS.get(@city).nil?
      return JSON.parse(redis.get(@city))
    else
      resp = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{URI.escape(@city)}&APPID=#{ENV['API_KEY']}")
      REDIS.set(@city, resp.body)
      REDIS.expire @city, 300 ## 5 minutes
      JSON.parse(resp.body)
    end
  end

  def temp
    data = weather_data
    return nil if data.nil? || data['main'].nil? || data['main']['temp'].nil?
    # convert temp from kelvin to Farenheit
    (data['main']['temp'] * 9/5 - 459.67).round(2)
  end

  def icons
    data = weather_data
    return [] if data.nil? || data['weather'].nil?
    data['weather'].collect do |weather|
      weather['icon'] + ".png"
    end.uniq
  end
end
