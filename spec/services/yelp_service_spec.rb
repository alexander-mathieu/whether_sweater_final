# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    it '#retrieve_open_restaurants' do
      open_restaurants = subject.retrieve_open_restaurants('pueblo,co', 'chinese', 1_564_430_400)

      expect(open_restaurants).to be_an(Array)
      expect(open_restaurants.first).to have_key(:name)
      expect(open_restaurants.first[:location]).to have_key(:display_address)
    end
  end
end
