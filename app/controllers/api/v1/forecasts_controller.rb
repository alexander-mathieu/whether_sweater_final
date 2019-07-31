# frozen_string_literal: true

class Api::V1::ForecastsController < Api::V1::BaseController
  def show
    facade = ForecastFacade.new(location_params)
    render json: ForecastSerializer.new(facade.location_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
