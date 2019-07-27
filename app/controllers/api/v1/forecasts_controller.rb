class Api::V1::ForecastsController < ApplicationController
  def show
    latlong = google_maps_service.retrieve_latlong(params[:location])
  end

  private

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end
end
