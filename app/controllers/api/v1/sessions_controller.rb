# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: user_params[:email])

    if user&.authenticate(params[:password])
      render json: { api_key: user.api_key }, status: 200
    else
      render json: { error: 'Failed to authenticate user' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
