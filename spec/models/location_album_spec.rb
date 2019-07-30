# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationAlbum do
  before :each do
    image_data = File.read('./spec/fixtures/flickr_images.json')
    images = JSON.parse(image_data, symbolize_names: true)

    @location_album = LocationAlbum.new(images)
  end

  it 'exists' do
    expect(@location_album).to be_a(LocationAlbum)
  end

  describe 'instance methods' do
    it '#background_images' do
      background_images = @location_album.background_images

      expect(background_images).to be_an(Array)
      expect(background_images.count).to eq(10)
      expect(background_images.first).to have_key(:alt)
      expect(background_images.first).to have_key(:url)
    end
  end
end
