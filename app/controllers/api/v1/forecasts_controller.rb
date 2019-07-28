class Api::V1::ForecastsController < ApplicationController
  def show
    facade = ForecastShowFacade.new(params[:location])
    render json: ForecastSerializer.serialize(facade.location_forecast)
  end
end
