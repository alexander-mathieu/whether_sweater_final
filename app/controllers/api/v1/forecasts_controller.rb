class Api::V1::ForecastsController < ApplicationController
  def show
    google_geocoding_service.retrieve_lat_long(params[:location])
  end

  private

  def google_geocoding_service
    @google_geocoding_service ||= GoogleGeocodingService.new
  end
end
