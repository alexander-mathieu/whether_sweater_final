class RestaurantForecast
  attr_reader :start, :end, :food

  def initialize(road_trip_info, food, restaurants)
    @road_trip_info = road_trip_info
    @restaurants = restaurants
    @start = road_trip_info[:origin]
    @end = road_trip_info[:destination]
    @food = food
    @travel_time = road_trip_info[:value]
  end

  def open_restaurants
    restaurants.map do |restaurant|
      require 'pry'; binding.pry
    end
  end

  private

  attr_reader :travel_time, :restaurants

  def arrival_time
    travel_time + Time.now.to_i
  end
end
