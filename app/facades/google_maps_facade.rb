# frozen_string_literal: true

class GoogleMapsFacade
  def initialize(params)
    @params = params
  end

  def location_address
    location[:formatted_address]
  end

  def location_latlong
    params[:location] = params[:destination] if params[:destination]
    location[:geometry][:location]
  end

  def road_trip
    google_maps_service.retrieve_road_trip(params)
  end

  private

  attr_reader :params

  def location
    @location ||= google_maps_service.retrieve_location(params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
