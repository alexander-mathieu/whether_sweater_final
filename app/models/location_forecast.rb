# frozen_string_literal: true

class LocationForecast
  attr_reader :id, :address

  def initialize(location_address, forecast)
    @id = nil
    @address = location_address
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end

  def date
    Time.at(currently[:time]).to_datetime.strftime('%m-%d')
  end

  def time
    Time.at(currently[:time]).to_datetime.strftime('%I:%M%p')
  end

  def summary
    currently[:summary]
  end

  def icon
    currently[:icon]
  end

  def temp
    currently[:temperature].round
  end

  def feels_like
    currently[:apparentTemperature].round
  end

  def forecast_high
    daily.first[:temperatureHigh].round
  end

  def forecast_low
    daily.first[:temperatureLow].round
  end

  def percent_humidity
    (currently[:humidity] * 100).to_i
  end

  def visibility_miles
    currently[:visibility].round(2)
  end

  def uv_index
    currently[:uvIndex]
  end


  def hourly_forecast
    hourly.map do |forecast|
      {
        time: Time.at(forecast[:time]).to_datetime.strftime('%I:%M%p'),
        temperature: forecast[:temperature].round
      }
    end
  end

  def daily_forecast
    daily.map do |forecast|
      {
        day: Time.at(forecast[:time]).to_datetime.strftime('%A'),
        summary: forecast[:summary],
        icon: forecast[:icon],
        percent_humidity: (forecast[:humidity] * 100).to_i,
        forecast_high: forecast[:temperatureHigh].round,
        forecast_low: forecast[:temperatureLow].round
      }
    end
  end

  private

  attr_reader :currently, :hourly, :daily
end
