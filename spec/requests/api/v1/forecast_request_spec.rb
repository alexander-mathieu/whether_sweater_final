# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecast API endpoint' do
  it 'delivers the forecast for a specific location' do

    VCR.use_cassette('forecast_api_endpoint') do
      get api_v1_forecast_path, params: { location: 'denver,co' }

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast).to have_key(:location)
      expect(forecast).to have_key(:currently)
      expect(forecast).to have_key(:hourly)
      expect(forecast).to have_key(:daily)

      expect(forecast[:hourly].count).to eq(8)
      expect(forecast[:daily].count).to eq(5)
    end
  end
end
