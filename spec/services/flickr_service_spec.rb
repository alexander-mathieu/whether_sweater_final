# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlickrService do
  describe 'instance methods' do
    it '#images_search' do
      flickr_service = FlickrService.new('39.7392358', '-104.990251')

      response = flickr_service.images_search

      expect(response).to be_an(Array)
      expect(response[0]).to have_key(:id)
      expect(response[0]).to have_key(:owner)
      expect(response[0]).to have_key(:title)
    end
  end
end
