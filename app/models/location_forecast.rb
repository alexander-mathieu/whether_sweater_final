# frozen_string_literal: true

class LocationForecast
  attr_reader :location_address, :currently, :hourly, :daily

  def initialize(location_address, forecast)
    @location_address = location_address
    @currently = forecast[:currently]
    @hourly = forecast[:hourly][:data][0..7]
    @daily = forecast[:daily][:data][1..5]
  end
end
