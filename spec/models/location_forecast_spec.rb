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
    it '#address' do
      expect(@location_forecast.address).to eq('Denver, CO, USA')
    end

    it '#date' do
      expect(@location_forecast.date).to eq('07-26')
    end

    it '#time' do
      expect(@location_forecast.time).to eq('08:19PM')
    end

    it '#summary' do
      expect(@location_forecast.summary).to eq('Mostly Cloudy')
    end

    it '#icon' do
      expect(@location_forecast.icon).to eq('partly-cloudy-night')
    end

    it '#temp' do
      expect(@location_forecast.temp).to eq(82)
    end

    it '#feels_like' do
      expect(@location_forecast.feels_like).to eq(82)
    end

    it '#forecast_high' do
      expect(@location_forecast.forecast_high).to eq(86)
    end

    it '#forecast_low' do
      expect(@location_forecast.forecast_low).to eq(68)
    end

    it '#percent_humidity' do
      expect(@location_forecast.percent_humidity).to eq(32)
    end

    it '#uv_index' do
      expect(@location_forecast.uv_index).to eq(0)
    end

    it '#visibility' do
      expect(@location_forecast.visibility_miles).to eq(2.44)
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
