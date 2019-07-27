# frozen_string_literal: true

class DarkskyService
  def retrieve_forecast(latlong)
    parse_response("#{latlong}")
  end

  private

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}")
  end
end
