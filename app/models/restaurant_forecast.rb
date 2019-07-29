class RestaurantForecast
  attr_reader :destination, :open_restaurants, :food

  def initialize(food, open_restaurants, limit = 3)
    @destination = open_restaurants.first[:location][:city]
    @open_restaurants = open_restaurants[0..limit]
    @food = food
  end
end
