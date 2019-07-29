class Api::V1::MunchiesController < ApplicationController
  def show
    user = User.find_by(api_key: params[:api_key])

    if user
      render json: {success: 'Sweet!'}, status: 200
    else
      render json: { error: 'Unauthorized API key' }, status: 401
    end
  end
end
