# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Background API endpoint' do
  it 'delivers backgrounds for a specific location' do

    VCR.use_cassette('background_api_endpoint') do
      get api_v1_backgrounds_path, params: { location: 'denver,co' }

      expect(response).to be_successful

      background_images = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(background_images).to be_an(Array)
      expect(background_images.first[:attributes]).to have_key(:alt)
      expect(background_images.first[:attributes]).to have_key(:url)
    end
  end
end
