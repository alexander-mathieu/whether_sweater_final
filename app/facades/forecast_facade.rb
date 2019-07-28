# frozen_string_literal: true

class ForecastFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def location_forecast
    @location_forecast ||= LocationForecast.new(location_address, forecast)
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
    location_latlong[:lat].to_s
  end

  def flickr_long
    location_latlong[:lng].to_s
  end

  def forecast
    @forecast ||= darksky_service.retrieve_forecast(darksky_latlong)
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new
  end

  def darksky_latlong
    location_latlong[:lat].to_s + ',' + location_latlong[:lng].to_s
  end

  def location_latlong
    location_info[:geometry][:location]
  end

  def location_address
    location_info[:formatted_address]
  end

  def location_info
    @location_info ||= google_maps_service.retrieve_location_info(location_params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
