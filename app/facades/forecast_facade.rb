# frozen_string_literal: true

class ForecastFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def location_forecast
    @location_forecast ||= LocationForecast.new(forecast)
  end

  def background_images
    @background_images ||= flickr_service.images_search
  end

  private

  attr_reader :location_params

  def flickr_service
    @flickr_service ||= FlickrService.new(flickr_lat, flickr_long)
  end

  def flickr_lat
    latlong[:lat].to_s
  end

  def flickr_long
    latlong[:lng].to_s
  end

  def forecast
    @forecast ||= darksky_service.retrieve_forecast(darksky_latlong)
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new
  end

  def darksky_latlong
    latlong[:lat].to_s + ',' + latlong[:lng].to_s
  end

  def latlong
    @latlong ||= google_maps_service.retrieve_latlong(location_params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
