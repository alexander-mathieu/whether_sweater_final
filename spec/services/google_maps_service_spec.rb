# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleMapsService do
  describe 'instance methods' do
    it '#retrieve_location_info' do
      response = subject.retrieve_location_info('denver,co')

      expect(response).to be_a(Hash)
      expect(response[:formatted_address]).to eq('Denver, CO, USA')
      expect(response[:geometry][:location][:lat]).to eq(39.7392358)
      expect(response[:geometry][:location][:lng]).to eq(-104.990251)
    end
  end
end
