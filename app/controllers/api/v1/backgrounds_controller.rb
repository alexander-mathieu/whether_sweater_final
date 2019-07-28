# frozen_string_literal:true

class Api::V1::BackgroundsController < ApplicationController
  def show
    facade = ForecastFacade.new(params[:location])
    render json: BackgroundSerializer.serialize(facade.background_images)
  end
end
