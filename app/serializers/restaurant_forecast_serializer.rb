# frozen_string_literal: true

class RestaurantForecastSerializer
  def self.serialize(restaurant_forecast)
    {
      data: {
        destination: restaurant_forecast.destination,
        food: restaurant_forecast.food,
        open_restaurants:
          restaurant_forecast.open_restaurants.map do |restaurant|
            { name: restaurant[:name],
              address: restaurant[:location][:display_address][0] }
          end
      }
    }
  end
end
