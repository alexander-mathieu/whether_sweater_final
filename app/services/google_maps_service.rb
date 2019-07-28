# frozen_string_literal: true

class GoogleMapsService
  def retrieve_location_info(location)
    parse_response('geocode/json', address: location)[:results][0]
  end

  private

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new('https://maps.googleapis.com/maps/api') do |f|
      f.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
