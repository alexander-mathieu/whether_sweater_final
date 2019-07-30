# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleMapsService do
  describe 'instance methods' do
    it '#retrieve_location' do
      location_params = { location: 'denver,co' }

      google_maps_service = GoogleMapsService.new(location_params)

      response = google_maps_service.retrieve_location

      expect(response).to be_a(Hash)
      expect(response[:formatted_address]).to eq('Denver, CO, USA')
      expect(response[:geometry][:location][:lat]).to eq(39.7392358)
      expect(response[:geometry][:location][:lng]).to eq(-104.990251)
    end

    it '#retrieve_road_trip' do
      road_trip_params = { origin: 'denver,co',
                           destination: 'pueblo,co' }

      google_maps_service = GoogleMapsService.new(road_trip_params)

      response = google_maps_service.retrieve_road_trip

      expect(response).to be_a(Hash)
      expect(response).to have_key(:duration)
      expect(response[:duration]).to have_key(:value)
      expect(response[:start_address]).to eq('Denver, CO, USA')
      expect(response[:end_address]).to eq('Pueblo, CO, USA')
    end
  end
end
