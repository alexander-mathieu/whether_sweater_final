class Api::V1::ForecastsController < ApplicationController
  def show
    Rails.cache.fetch("#{params[:location]}-forecast", expires_in: 15.minutes) do
      facade = ForecastShowFacade.new(params[:location])
      render json: ForecastSerializer.serialize(facade.location_forecast)
    end
  end
end
