# frozen_string_literal: true

class RestaurantForecast
  attr_reader :food, :open_restaurants

  def initialize(food, open_restaurants, limit = 3)
    @open_restaurants = open_restaurants[0..(limit - 1)]
    @food = food
  end

  def destination
    "#{open_restaurants.first[:location][:city]}, #{open_restaurants.first[:location][:state]}"
  end
end
