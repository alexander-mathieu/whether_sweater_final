class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = ForecastFacade.new(params[:location])
    render json: BackgroundSerializer.new(facade.background_images)
  end
end
