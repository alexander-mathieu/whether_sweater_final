# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API endpoint' do
  it 'creates an account for a user when valid params are sent' do
    params = {
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post api_v1_users_path, params: params

    expect(response.status).to eq(201)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:api_key)
  end

  it 'does not create an account for a user when invalid params are sent' do
    params = {
      email: 'user@example.com'
    }

    post api_v1_users_path, params: params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:error]).to eq('Failed to create user')
  end
end
