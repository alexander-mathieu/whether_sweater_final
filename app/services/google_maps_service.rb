# frozen_string_literal: true

class GoogleMapsService
  def initialize(params)
    @params = params
  end

  def retrieve_location
    parse_response('geocode/json', address: params[:location])[:results][0]
  end

  def retrieve_road_trip
    parse_response('directions/json', origin: params[:origin], destination: params[:destination])[:routes][0][:legs][0]
  end

  private

  attr_reader :params

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
