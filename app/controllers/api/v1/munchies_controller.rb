class Api::V1::MunchiesController < ApplicationController
  def show
    user = User.find_by(api_key: params[:api_key])

    if user
      facade = ForecastFacade.new(munchies_params)
      render json: RestaurantForecastSerializer.serialize(facade.restaurant_forecast)
    else
      render json: { error: 'Unauthorized API key' }, status: 401
    end
  end

  private

  def munchies_params
    params.permit(:start, :end, :food)
  end
end
