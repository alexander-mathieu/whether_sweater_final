# frozen_string_literal:true

class Api::V1::BackgroundsController < Api::V1::BaseController
  def show
    facade = BackgroundFacade.new(location_params)
    render json: BackgroundSerializer.new(facade.location_images)
  end

  private

  def location_params
    params.permit(:location)
  end
end
