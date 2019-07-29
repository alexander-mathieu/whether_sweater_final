class RestaurantForecastSerializer
  def self.serialize(restaurant_forecast)
    {
      data: {
        start: restaurant_forecast.start,
        end: restaurant_forecast.end,
        food: restaurant_forecast.food,
        open_restaurants: [
          {
            name: restaurant_forecast.open_restaurants[0].name,
            address: restaurant_forecast.open_restaurants[0].address
          },
          {
            name: restaurant_forecast.open_restaurants[1].name,
            address: restaurant_forecast.open_restaurants[1].address
          },
          {
            name: restaurant_forecast.open_restaurants[2].name,
            address: restaurant_forecast.open_restaurants[2].address
          }
        ]
      }
    }
  end
end
