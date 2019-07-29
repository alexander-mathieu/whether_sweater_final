class RestaurantForecastSerializer
  def self.serialize(restaurant_forecast)
    {
      data: {
        destination: restaurant_forecast.destination,
        food: restaurant_forecast.food,
        open_restaurants: [
          {
            name: restaurant_forecast.open_restaurants[0][:name],
            address: restaurant_forecast.open_restaurants[0][:location][:display_address]
          },
          {
            name: restaurant_forecast.open_restaurants[1][:name],
            address: restaurant_forecast.open_restaurants[1][:location][:display_address]
          },
          {
            name: restaurant_forecast.open_restaurants[2][:name],
            address: restaurant_forecast.open_restaurants[2][:location][:display_address]
          }
        ]
      }
    }
  end
end
