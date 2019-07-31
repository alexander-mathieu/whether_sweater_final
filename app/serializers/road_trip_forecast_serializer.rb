# frozen_string_literal: true

class RoadTripForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :road_trip_forecast

  attributes :origin,
             :destination,
             :trip_duration,
             :summary,
             :icon

  attribute :temp do |object|
    object.temp.round
  end

  attribute :feels_like do |object|
    object.feels_like.round
  end

  attribute :percent_humidity do |object|
    (object.humidity * 100).to_i
  end

  attribute :visibility_miles do |object|
    object.visibility.round(2)
  end

  attribute :uv_index
end
