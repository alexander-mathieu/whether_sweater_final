# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin, :destination

  def initialize(road_trip_info, forecast)
    @origin = road_trip_info[:start_address]
    @destination = road_trip_info[:end_address]
    @duration_in_seconds = road_trip_info[:duration][:value]
    @forecast = forecast
  end

  def icon
    weather_on_arrival[:icon]
  end

  def feels_like
    weather_on_arrival[:apparentTemperature]
  end

  def percent_humidity
    (weather_on_arrival[:humidity] * 100).to_i
  end

  def summary
    weather_on_arrival[:summary]
  end

  def temperature
    weather_on_arrival[:temperature]
  end

  def uv_index
    weather_on_arrival[:uvIndex]
  end

  def visibility_miles
    weather_on_arrival[:visibility]
  end

  private

  attr_reader :duration_in_seconds, :forecast

  def weather_on_arrival
    @weather_on_arrival ||= forecast[:hourly][:data].min do |forecast|
      (time_on_arrival - forecast[:time]).abs
    end
  end

  def time_on_arrival
    duration_in_seconds + Time.now.to_i
  end
end
