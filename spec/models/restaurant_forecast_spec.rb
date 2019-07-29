# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantForecast do
  before :each do
    open_restaurant_data = File.read('./spec/fixtures/yelp_business_search.json')
    open_restaurants = JSON.parse(open_restaurant_data, symbolize_names: true)[:businesses]

    @restaurant_forecast = RestaurantForecast.new('chinese', open_restaurants)
  end

  it 'exists' do
    expect(@restaurant_forecast).to be_a(RestaurantForecast)
  end

  describe 'instance methods' do
    it '#food' do
    expect(@restaurant_forecast.food).to eq('chinese')
    end

    it '#open_restaurants' do
      expect(@restaurant_forecast.open_restaurants.count).to eq(3)
      expect(@restaurant_forecast.open_restaurants.first).to have_key(:name)
      expect(@restaurant_forecast.open_restaurants.first[:location]).to have_key(:display_address)
    end

    it '#destination' do
      expect(@restaurant_forecast.destination).to eq('Pueblo, CO')
    end
  end
end
