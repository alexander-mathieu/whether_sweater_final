# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User API endpoint' do
  it 'creates an account for a user' do
    params = {
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: params

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:api_key)
  end
end
