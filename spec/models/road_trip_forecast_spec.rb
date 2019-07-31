# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoadTripForecast do
  before :each do
    road_trip_data = File.read('./spec/fixtures/google_directions.json')
    road_trip = JSON.parse(road_trip_data, symbolize_names: true)[:routes][0][:legs][0]

    forecast_data = File.read('./spec/fixtures/darksky_pueblo_forecast.json')
    forecast = JSON.parse(forecast_data, symbolize_names: true)

    @road_trip_forecast = RoadTripForecast.new(road_trip, forecast)
  end

  it 'exists' do
    expect(@road_trip_forecast).to be_a(RoadTripForecast)
  end

  describe 'instance methods' do
    it '#origin' do
      expect(@road_trip_forecast.origin).to eq('Denver, CO, USA')
    end

    it '#destination' do
      expect(@road_trip_forecast.destination).to eq('Pueblo, CO, USA')
    end

    it '#trip_duration' do
      expect(@road_trip_forecast.trip_duration).to eq('1 hour 47 mins')
    end

    it '#summary' do
      expect(@road_trip_forecast.summary).to eq('Clear')
    end

    it '#icon' do
      expect(@road_trip_forecast.icon).to eq('clear-day')
    end

    it '#temp' do
      expect(@road_trip_forecast.temp).to eq(85.09)
    end

    it '#feels_like' do
      expect(@road_trip_forecast.feels_like).to eq(85.09)
    end

    it '#humidity' do
      expect(@road_trip_forecast.humidity).to eq(0.33)
    end

    it '#uv_index' do
      expect(@road_trip_forecast.uv_index).to eq(0)
    end

    it '#visibility' do
      expect(@road_trip_forecast.visibility).to eq(9.138)
    end
  end
end
