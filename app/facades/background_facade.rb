# frozen_string_literal: true

class BackgroundFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def location_images
    images.map do |image|
      LocationImage.new(image)
    end
  end

  private

  attr_reader :location_params

  def images
    Rails.cache.fetch("background-images-#{location_params[:location]}", expires_in: 24.hours) do
      flickr_service.retrieve_images
    end
  end

  def flickr_service
    FlickrService.new(flickr_lat, flickr_long)
  end

  def flickr_lat
    google_maps_facade.location_latlong[:lat].to_s
  end

  def flickr_long
    google_maps_facade.location_latlong[:lng].to_s
  end

  def google_maps_facade
    @google_maps_facade ||= GoogleMapsFacade.new(location_params)
  end
end
