# frozen_string_literal: true

class ForecastSerializer
  def self.serialize(location_forecast)
    {
      data: {
        location: location_forecast.location_address,
        currently: {
          date: location_forecast.current_date,
          time: location_forecast.current_time,
          summary: location_forecast.current_summary,
          icon: location_forecast.current_icon,
          temperature: location_forecast.current_temp.round,
          forecast_high: location_forecast.daily_high.round,
          forecast_low: location_forecast.daily_low.round,
          feels_like: location_forecast.current_apparent_temp.round,
          percent_humidity: location_forecast.current_percent_humidity,
          visibility_miles: location_forecast.current_visibility.round(2),
          uv_index: location_forecast.current_uv_index
        },
        hourly: location_forecast.hourly_forecast,
        daily: location_forecast.daily_forecast
      }
    }
  end
end
