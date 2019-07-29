# frozen_string_literal: true

class GoogleMapsService
  def retrieve_location_info(location_params)
    parse_response('geocode/json', address: location_params[:location])[:results][0]
  end

  def retrieve_road_trip_info(road_trip_params)
    parse_response('directions/json', origin: road_trip_params[:origin], destination: road_trip_params[:destination])[:routes][0][:legs][0]
  end

  private

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new('https://maps.googleapis.com/maps/api') do |f|
      f.params['key'] = ENV['GOOGLE_MAPS_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
