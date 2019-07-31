# frozen_string_literal: true

class Api::V1::ForecastsController < ApplicationController
  def show
    facade = ForecastFacade.new(location_params)
    render json: ForecastSerializer.new(facade.location_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
