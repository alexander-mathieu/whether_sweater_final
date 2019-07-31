# frozen_string_literal: true

class RoadTripFacade
  def initialize(road_trip_params)
    @road_trip_params = road_trip_params
  end

  def road_trip_forecast
    Rails.cache.fetch("#{road_trip_params[:origin]}-#{road_trip_params[:destination]}-forecast", expires_in: 5.minutes) do
      RoadTripForecast.new(road_trip, forecast)
    end
  end

  private

  attr_reader :road_trip_params

  def forecast
    darksky_service.retrieve_forecast
  end

  def darksky_service
    DarkskyService.new(darksky_latlong)
  end

  def darksky_latlong
    location_latlong[:lat].to_s + ',' + location_latlong[:lng].to_s
  end

  def location_latlong
    @location_latlong ||= google_maps_facade.location_latlong
  end

  def road_trip
    google_maps_facade.road_trip
  end

  def google_maps_facade
    @google_maps_facade ||= GoogleMapsFacade.new(road_trip_params)
  end
end
