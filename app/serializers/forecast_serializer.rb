# frozen_string_literal: true

class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :location_forecast

  attributes :address,
             :summary,
             :icon

  attribute :date do |object|
    Time.at(object.unix_time).to_datetime.strftime('%m-%d')
  end

  attribute :time do |object|
    Time.at(object.unix_time).to_datetime.strftime('%I:%M%p')
  end

  attribute :temp do |object|
    object.temp.round
  end

  attribute :feels_like do |object|
    object.feels_like.round
  end

  attribute :forecast_high do |object|
    object.forecast_high.round
  end

  attribute :forecast_low do |object|
    object.forecast_low.round
  end

  attribute :percent_humidity do |object|
    (object.humidity * 100).to_i
  end

  attribute :visibility_miles do |object|
    object.visibility.round(2)
  end

  attribute :uv_index

  attribute :hourly_forecast do |object|
    object.hourly.map do |forecast|
      {
        time: Time.at(object.unix_time).to_datetime.strftime('%I:%M%p'),
        temp: object.temp.round
      }
    end
  end

  attribute :daily_forecast do |object|
    object.daily.map do |forecast|
      {
        day: Time.at(object.unix_time).to_datetime.strftime('%A'),
        summary: object.summary,
        icon: object.icon,
        percent_humidity: (object.humidity * 100).to_i,
        forecast_high: object.forecast_high.round,
        forecast_low: object.forecast_low.round
      }
    end
  end
end
