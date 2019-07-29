# frozen_string_literal: true

class RoadTripForecastSerializer
  def self.serialize(road_trip_forecast)
    {
      data: {
        origin: road_trip_forecast.origin,
        destination: road_trip_forecast.destination,
        weather_on_arrival: {
          summary: road_trip_forecast.weather_on_arrival[:summary],
          icon: road_trip_forecast.weather_on_arrival[:icon],
          temperature: road_trip_forecast.weather_on_arrival[:temperature].round,
          feels_like: road_trip_forecast.weather_on_arrival[:apparentTemperature].round,
          percent_humidity: (road_trip_forecast.weather_on_arrival[:humidity] * 100).to_i,
          visibility_miles: road_trip_forecast.weather_on_arrival[:visibility].round(2),
          uv_index: road_trip_forecast.weather_on_arrival[:uvIndex]
        }
      }
    }
  end
end
