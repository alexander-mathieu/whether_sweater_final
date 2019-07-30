# frozen_string_literal: true

class LocationForecast
  attr_reader :location_address, :currently, :hourly, :daily

  def initialize(location_address, forecast)
    @location_address = location_address
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end

  def current_apparent_temp
    currently[:apparentTemperature]
  end

  def current_date
    Time.at(currently[:time]).to_datetime.strftime('%I:%M%p')
  end

  def current_icon
    currently[:icon]
  end

  def current_percent_humidity
    (currently[:humidity] * 100).to_i
  end

  def current_summary
    currently[:summary]
  end

  def current_temp
    currently[:temperature]
  end

  def current_time
    Time.at(currently[:time]).to_datetime.strftime('%m-%d')
  end

  def current_uv_index
    currently[:uvIndex]
  end

  def current_visibility
    currently[:visibility]
  end

  def daily_high
    daily.first[:temperatureHigh]
  end

  def daily_low
    daily.first[:temperatureLow]
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
end
