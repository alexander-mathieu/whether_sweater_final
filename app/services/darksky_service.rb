# frozen_string_literal: true

class DarkskyService
  def initialize(latlong)
    @latlong = latlong
  end

  def retrieve_forecast
    parse_response(latlong.to_s)
  end

  private

  attr_reader :latlong

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}")
  end
end
