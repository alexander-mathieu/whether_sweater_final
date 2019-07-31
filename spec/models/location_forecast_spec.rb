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

    it '#unix_time' do
      expect(@location_forecast.unix_time).to eq(1564193978)
    end

    it '#summary' do
      expect(@location_forecast.summary).to eq('Mostly Cloudy')
    end

    it '#icon' do
      expect(@location_forecast.icon).to eq('partly-cloudy-night')
    end

    it '#temp' do
      expect(@location_forecast.temp).to eq(81.94)
    end

    it '#feels_like' do
      expect(@location_forecast.feels_like).to eq(81.94)
    end

    it '#forecast_high' do
      expect(@location_forecast.forecast_high).to eq(86.19)
    end

    it '#forecast_low' do
      expect(@location_forecast.forecast_low).to eq(67.83)
    end

    it '#humidity' do
      expect(@location_forecast.humidity).to eq(0.32)
    end

    it '#uv_index' do
      expect(@location_forecast.uv_index).to eq(0)
    end

    it '#visibility' do
      expect(@location_forecast.visibility).to eq(2.436)
    end
  end
end
