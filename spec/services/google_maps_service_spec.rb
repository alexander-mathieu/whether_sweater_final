# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleMapsService do
  describe 'instance methods' do
    it '#retrieve_latlong' do
      response = subject.retrieve_latlong('denver,co')

      expect(response).to be_a(Hash)
      expect(response[:lat]).to eq(39.7392358)
      expect(response[:lng]).to eq(-104.990251)
    end
  end
end
