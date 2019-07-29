# frozen_string_literal: true

class RoadTripForecast
  attr_reader :origin, :destination

  def initialize(road_trip_info, forecast)
    @origin = road_trip_info[:start_address]
    @destination = road_trip_info[:end_address]
    @duration_in_seconds = road_trip_info[:duration][:value]
    @forecast = forecast
  end

  def weather_on_arrival
    @weather_on_arrival ||= forecast[:hourly][:data].min do |forecast|
      (time_on_arrival - forecast[:time]).abs
    end
  end

  private

  attr_reader :duration_in_seconds, :forecast

  def time_on_arrival
    duration_in_seconds + Time.now.to_i
  end
end
