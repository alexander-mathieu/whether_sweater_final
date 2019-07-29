# frozen_string_literal: true

class ForecastFacade
  def initialize(params)
    @params = params
  end

  def background_images
    @background_images ||= flickr_service.images_search
  end

  def location_forecast
    @location_forecast ||= LocationForecast.new(location_address, forecast)
  end

  def restaurant_forecast
    @restaurant_forecast ||= RestaurantForecast.new(road_trip_info, params[:food], restaurants)
  end

  def road_trip_forecast
    @road_trip_forecast ||= RoadTripForecast.new(road_trip_info, forecast)
  end

  private

  attr_reader :params

  def restaurants
    @restaurants ||= yelp_service.retrieve_restaurants(params[:end], params[:food])
  end

  def yelp_service
    @yelp_service ||= YelpService.new
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
    location_info[:geometry][:location]
  end

  def location_address
    location_info[:formatted_address]
  end

  def location_info
    @location_info ||= google_maps_service.retrieve_location_info(params)
  end

  def road_trip_info
    @road_trip_info ||= google_maps_service.retrieve_road_trip_info(params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
