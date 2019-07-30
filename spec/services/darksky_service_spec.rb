# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DarkskyService do
  describe 'instance methods' do
    it '#retrieve_forecast' do
      darksky_service = DarkskyService.new('39.7392358,-104.990251')
      
      response = darksky_service.retrieve_forecast

      expect(response).to be_a(Hash)

      expect(response[:currently]).to have_key(:temperature)
      expect(response[:currently]).to have_key(:apparentTemperature)
      expect(response[:currently]).to have_key(:humidity)
      expect(response[:currently]).to have_key(:uvIndex)

      expect(response[:hourly][:data]).to be_an(Array)
      expect(response[:daily][:data]).to be_an(Array)
    end
  end
end
