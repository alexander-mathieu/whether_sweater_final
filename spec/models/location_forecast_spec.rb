# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationForecast do
  before :each do
    forecast_data = File.read('./spec/fixtures/darksky_denver_forecast.json')
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

    it '#current_apparent_temp' do
      expect(@location_forecast.current_apparent_temp).to eq(81.94)
    end

    it '#current_date' do
      expect(@location_forecast.current_date).to eq('07-26')
    end

    it '#current_icon' do
      expect(@location_forecast.current_icon).to eq('partly-cloudy-night')
    end

    it '#current_summary' do
      expect(@location_forecast.current_summary).to eq('Mostly Cloudy')
    end

    it '#current_temp' do
      expect(@location_forecast.current_temp).to eq(81.94)
    end

    it '#current_percent_humidity' do
      expect(@location_forecast.current_percent_humidity).to eq(32)
    end

    it '#current_time' do
      expect(@location_forecast.current_time).to eq('08:19PM')
    end

    it '#current_uv_index' do
      expect(@location_forecast.current_uv_index).to eq(0)
    end

    it '#current_visibility' do
      expect(@location_forecast.current_visibility).to eq(2.436)
    end

    it '#daily_high' do
      expect(@location_forecast.daily_high).to eq(86.19)
    end

    it '#daily_low' do
      expect(@location_forecast.daily_low).to eq(67.83)
    end

    it '#hourly_forecast' do
      expect(@location_forecast.hourly_forecast).to be_an(Array)
      expect(@location_forecast.hourly_forecast.count).to eq(8)
    end

    it '#daily_forecast' do
      expect(@location_forecast.daily_forecast).to be_an(Array)
      expect(@location_forecast.daily_forecast.count).to eq(5)
    end
  end
end
