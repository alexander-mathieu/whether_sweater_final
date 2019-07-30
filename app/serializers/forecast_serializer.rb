# frozen_string_literal: true

class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :location_forecast

  attributes :address,
             :date,
             :time,
             :summary,
             :icon,
             :temp,
             :feels_like,
             :forecast_high,
             :forecast_low,
             :uv_index,
             :visibility_miles,
             :hourly_forecast,
             :daily_forecast
end
