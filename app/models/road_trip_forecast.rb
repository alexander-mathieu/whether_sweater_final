# frozen_string_literal: true

class RoadTripForecast
  attr_reader :id, :origin, :destination, :trip_duration

  def initialize(road_trip, forecast)
    @id = nil
    @origin = road_trip[:start_address]
    @destination = road_trip[:end_address]
    @trip_duration = road_trip[:duration][:text]
    @trip_duration_seconds = road_trip[:duration][:value]
    @forecast = forecast
  end

  def summary
    weather_on_arrival[:summary]
  end

  def icon
    weather_on_arrival[:icon]
  end

  def temp
    weather_on_arrival[:temperature]
  end

  def feels_like
    weather_on_arrival[:apparentTemperature]
  end

  def humidity
    weather_on_arrival[:humidity]
  end

  def uv_index
    weather_on_arrival[:uvIndex]
  end

  def visibility
    weather_on_arrival[:visibility]
  end

  private

  attr_reader :forecast, :trip_duration_seconds

  def weather_on_arrival
    @weather_on_arrival ||= forecast[:hourly][:data].min do |forecast|
      (time_on_arrival - forecast[:time]).abs
    end
  end

  def time_on_arrival
    trip_duration_seconds + Time.now.to_i
  end
end
