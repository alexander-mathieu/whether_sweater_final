# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Road Trip API endpoint' do
  it 'delivers the forecast for a destination at arrival time when an authorized API key is sent' do
    user_params = { email: 'user@example.com',
                    password: 'password' }

    user = User.create!(user_params)

    params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: user.api_key
    }

    post api_v1_roadtrip_path, params: params

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:location)
  end

  it 'does not deliver the forecast for a destination at arrival time when an unauthorized API key is sent' do
    params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    post api_v1_roadtrip_path, params: params

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:error]).to eq('Unauthorized API key')
  end
end
