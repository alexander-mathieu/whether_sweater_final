# frozen_string_literal: true

class RoadTripForecast
  attr_reader :id,
              :origin,
              :destination,
              :trip_duration,
              :icon,
              :feels_like,
              :percent_humidity,
              :summary,
              :temperature,
              :uv_index,
              :visibility_miles

  def initialize(road_trip, forecast)
    @id = nil
    @origin = road_trip[:start_address]
    @destination = road_trip[:end_address]
    @trip_duration = road_trip[:duration][:value]
    @forecast = forecast
    @icon = weather_on_arrival[:icon]
    @feels_like = weather_on_arrival[:apparentTemperature]
    @percent_humidity = (weather_on_arrival[:humidity] * 100).to_i
    @summary = weather_on_arrival[:summary]
    @temperature = weather_on_arrival[:temperature]
    @uv_index = weather_on_arrival[:uvIndex]
    @visibility_miles = weather_on_arrival[:visibility]
  end

  private

  attr_reader :forecast

  def weather_on_arrival
    @weather_on_arrival ||= forecast[:hourly][:data].min do |forecast|
      (time_on_arrival - forecast[:time]).abs
    end
  end

  def time_on_arrival
    trip_duration + Time.now.to_i
  end
end
