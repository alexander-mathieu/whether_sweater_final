class RestaurantForecast
  attr_reader :destination, :open_restaurants, :food

  def initialize(food, open_restaurants, limit = 3)
    @open_restaurants = open_restaurants[0..(limit - 1)]
    @destination = destination
    @food = food
  end

  def destination
    "#{open_restaurants.first[:location][:city]}, #{open_restaurants.first[:location][:state]}"
  end
end
