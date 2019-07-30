# frozen_string_literal: true

class RoadTripForecastSerializer
  def self.serialize(road_trip_forecast)
    {
      data: {
        origin: road_trip_forecast.origin,
        destination: road_trip_forecast.destination,
        weather_on_arrival: {
          summary: road_trip_forecast.summary,
          icon: road_trip_forecast.icon,
          temperature: road_trip_forecast.temperature.round,
          feels_like: road_trip_forecast.feels_like.round,
          percent_humidity: road_trip_forecast.percent_humidity,
          visibility_miles: road_trip_forecast.visibility_miles.round(2),
          uv_index: road_trip_forecast.uv_index
        }
      }
    }
  end
end
