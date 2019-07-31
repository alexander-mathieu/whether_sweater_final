# frozen_string_literal: true

class LocationForecast
  attr_reader :id, :address, :hourly, :daily

  def initialize(location_address, forecast)
    @id = nil
    @address = location_address
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end

  def unix_time
    currently[:time]
  end
  
  def summary
    currently[:summary]
  end

  def icon
    currently[:icon]
  end

  def temp
    currently[:temperature]
  end

  def feels_like
    currently[:apparentTemperature]
  end

  def forecast_high
    daily.first[:temperatureHigh]
  end

  def forecast_low
    daily.first[:temperatureLow]
  end

  def humidity
    currently[:humidity]
  end

  def visibility
    currently[:visibility]
  end

  def uv_index
    currently[:uvIndex]
  end

  private

  attr_reader :currently
end
