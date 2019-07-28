# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationForecast do
  before :each do
    forecast_data = File.read('./spec/fixtures/darksky_location_forecast.json')
    forecast = JSON.parse(forecast_data, symbolize_names: true)

    @location_forecast = LocationForecast.new('Denver, CO, USA', forecast)
  end

  it 'exists' do
    expect(@location_forecast).to be_a(LocationForecast)
  end

  describe 'instance methods' do
    it '#location_address' do
      expect(@location_forecast.location_address).to eq('Denver, CO, USA')
    end

    it '#currently' do
      expect(@location_forecast.currently).to be_a(Hash)
    end

    it '#hourly' do
      expect(@location_forecast.hourly).to be_an(Array)
      expect(@location_forecast.hourly.count).to eq(49)
    end

    it '#daily' do
      expect(@location_forecast.daily).to be_an(Array)
      expect(@location_forecast.daily.count).to eq(8)
    end
  end
end
