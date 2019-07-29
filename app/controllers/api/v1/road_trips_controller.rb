class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      facade = ForecastFacade.new(road_trip_params)
      render json: RoadTripForecastSerializer.serialize(facade.road_trip_forecast)
    else
      render json: { error: 'Unauthorized API key' }, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
