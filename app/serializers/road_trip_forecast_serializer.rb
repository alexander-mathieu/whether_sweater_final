# frozen_string_literal: true

class RoadTripForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :road_trip_forecast

  attributes :origin,
             :destination,
             :trip_duration,
             :icon,
             :feels_like,
             :percent_humidity,
             :summary,
             :temperature,
             :uv_index,
             :visibility_miles
end
