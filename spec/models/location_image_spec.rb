# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationImage do
  before :each do
    image_data = File.read('./spec/fixtures/flickr_images.json')
    image = JSON.parse(image_data, symbolize_names: true)[:photos][:photo][0]

    @location_image = LocationImage.new(image)
  end

  it 'exists' do
    expect(@location_image).to be_a(LocationImage)
  end

  describe 'instance methods' do
    it '#alt' do
      expect(@location_image.alt).to eq('Denver')
    end

    it '#url' do
      expect(@location_image.url).to eq('https://www.flickr.com/photos/74216903@N00/47949098166')
    end
  end
end
