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

    it '#weather_on_arrival' do
      expect(@road_trip_forecast.weather_on_arrival[:summary]).to eq('Clear')
      expect(@road_trip_forecast.weather_on_arrival[:icon]).to eq('clear-day')
      expect(@road_trip_forecast.weather_on_arrival[:temperature]).to eq(85.09)
      expect(@road_trip_forecast.weather_on_arrival[:apparentTemperature]).to eq(85.09)
      expect(@road_trip_forecast.weather_on_arrival[:humidity] * 100 ).to eq(33)
      expect(@road_trip_forecast.weather_on_arrival[:uvIndex]).to eq(0)
      expect(@road_trip_forecast.weather_on_arrival[:visibility]).to eq(9.138)
    end
  end
end
