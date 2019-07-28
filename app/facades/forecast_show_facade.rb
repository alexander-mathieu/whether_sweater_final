# frozen_string_literal: true

class ForecastShowFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def location_forecast
    LocationForecast.new(forecast)
  end

  private

  attr_reader :location_params

  def forecast
    darksky_service.retrieve_forecast(formatted_latlong)
  end

  def darksky_service
    DarkskyService.new
  end

  def formatted_latlong
    latlong[:lat].to_s + ',' + latlong[:lng].to_s
  end

  def latlong
    google_maps_service.retrieve_latlong(location_params)
  end

  def google_maps_service
    GoogleMapsService.new
  end
end
