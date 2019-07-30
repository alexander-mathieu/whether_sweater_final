# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Road Trip API endpoint' do
  it 'delivers the forecast for a destination at arrival time when an authorized API key is sent' do
    user_params = { email: 'user@example.com',
                    password: 'password' }

    user = User.create!(user_params)

    params = {
      origin: 'denver,co',
      destination: 'pueblo,co',
      api_key: user.api_key
    }

    VCR.use_cassette('road_trip_api_endpoint_success') do
      post api_v1_road_trip_path, params: params

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast[:attributes][:origin]).to eq('Denver, CO, USA')
      expect(forecast[:attributes][:destination]).to eq('Pueblo, CO, USA')
      expect(forecast[:attributes]).to have_key(:summary)
      expect(forecast[:attributes]).to have_key(:icon)
      expect(forecast[:attributes]).to have_key(:temperature)
      expect(forecast[:attributes]).to have_key(:feels_like)
      expect(forecast[:attributes]).to have_key(:percent_humidity)
      expect(forecast[:attributes]).to have_key(:visibility_miles)
      expect(forecast[:attributes]).to have_key(:uv_index)
    end
  end

  it 'does not deliver the forecast for a destination at arrival time when an unauthorized API key is sent' do
    params = {
      origin: 'denver,co',
      destination: 'pueblo,co',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    VCR.use_cassette('road_trip_api_endpoint_failure') do
      post api_v1_road_trip_path, params: params

      expect(response.status).to eq(401)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:error]).to eq('Unauthorized API key')
    end
  end
end
