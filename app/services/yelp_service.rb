class YelpService
  def retrieve_open_restaurants(destination, food, open_at)
    params = {
      location: destination,
      categories: food,
      open_at: open_at
    }

    parse_response('search', params)[:businesses]
  end

  private

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new('https://api.yelp.com/v3/businesses') do |f|
      f.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end
end
