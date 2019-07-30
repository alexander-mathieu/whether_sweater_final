class ForecastSerializer
  def self.serialize(location_forecast)
    {
      data: {
        location: location_forecast.location_address,
        currently: {
          date: Time.at(location_forecast.currently[:time]).to_datetime.strftime('%m-%d'),
          time: Time.at(location_forecast.currently[:time]).to_datetime.strftime('%I:%M%p'),
          summary: location_forecast.currently[:summary],
          icon: location_forecast.currently[:icon],
          temperature: location_forecast.currently[:temperature].round,
          forecast_high: location_forecast.daily[0][:temperatureHigh].round,
          forecast_low: location_forecast.daily[0][:temperatureLow].round,
          feels_like: location_forecast.currently[:apparentTemperature].round,
          percent_humidity: (location_forecast.currently[:humidity] * 100).to_i,
          visibility_miles: location_forecast.currently[:visibility].round(2),
          uv_index: location_forecast.currently[:uvIndex]
        },
        hourly:
          location_forecast.hourly.map do |forecast|
            {
              time: Time.at(forecast[:time]).to_datetime.strftime('%I:%M%p'),
              temperature: forecast[:temperature].round
            }
          end,
        daily:
          location_forecast.daily.map do |forecast|
            {
              day: Time.at(forecast[:time]).to_datetime.strftime('%A'),
              summary: forecast[:summary],
              icon: forecast[:icon],
              percent_humidity: (forecast[:humidity] * 100).to_i,
              forecast_high: forecast[:temperatureHigh].round,
              forecast_low: forecast[:temperatureLow].round
            }
          end
      }
    }
  end
end
