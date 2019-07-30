# frozen_string_literal: true

class ForecastFacade
  def initialize(params)
    @params = params
  end

  def location_album
    @location_album ||= LocationAlbum.new(images)
  end

  def location_forecast
    @location_forecast ||= LocationForecast.new(location_address, forecast)
  end

  def road_trip_forecast
    @road_trip_forecast ||= RoadTripForecast.new(road_trip, forecast)
  end

  private

  attr_reader :params

  def images
    @images ||= flickr_service.retrieve_images
  end

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
    params[:location] = params[:destination] if params[:destination]
    location[:geometry][:location]
  end

  def location_address
    location[:formatted_address]
  end

  def location
    @location ||= google_maps_service.retrieve_location(params)
  end

  def road_trip
    @road_trip ||= google_maps_service.retrieve_road_trip(params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
