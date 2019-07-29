# frozen_string_literal:true

class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = ForecastFacade.new(location_params)
    render json: BackgroundSerializer.serialize(facade.background_images)
  end

  private

  def location_params
    params.permit(:location)
  end
end
