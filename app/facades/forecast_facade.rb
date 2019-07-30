# frozen_string_literal: true

class ForecastFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def location_forecast
    LocationForecast.new(location_address, forecast)
  end

  private

  attr_reader :location_params

  def forecast
    @forecast ||= darksky_service.retrieve_forecast(darksky_latlong)
  end

  def darksky_service
    DarkskyService.new
  end

  def darksky_latlong
    location_latlong[:lat].to_s + ',' + location_latlong[:lng].to_s
  end

  def location_address
    google_maps_facade.location_address
  end

  def location_latlong
    @location_latlong ||= google_maps_facade.location_latlong
  end

  def google_maps_facade
    @google_maps_facade ||= GoogleMapsFacade.new(location_params)
  end
end
