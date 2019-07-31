# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecast API endpoint' do
  it 'delivers the forecast for a specific location' do

    VCR.use_cassette('forecast_api_endpoint') do
      get api_v1_forecast_path, params: { location: 'denver,co' }

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast[:attributes]).to have_key(:address)
      expect(forecast[:attributes]).to have_key(:date)
      expect(forecast[:attributes]).to have_key(:time)
      expect(forecast[:attributes]).to have_key(:summary)
      expect(forecast[:attributes]).to have_key(:icon)
      expect(forecast[:attributes]).to have_key(:temp)
      expect(forecast[:attributes]).to have_key(:feels_like)
      expect(forecast[:attributes]).to have_key(:forecast_high)
      expect(forecast[:attributes]).to have_key(:forecast_low)
      expect(forecast[:attributes]).to have_key(:uv_index)
      expect(forecast[:attributes]).to have_key(:visibility_miles)
      expect(forecast[:attributes]).to have_key(:hourly_forecast)
      expect(forecast[:attributes]).to have_key(:visibility_miles)
      expect(forecast[:attributes][:hourly_forecast].count).to eq(8)
      expect(forecast[:attributes][:daily_forecast].count).to eq(5)
    end
  end
end
