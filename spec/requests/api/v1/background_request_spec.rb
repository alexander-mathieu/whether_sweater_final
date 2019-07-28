# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Background API endpoint' do
  it 'delivers backgrounds for a specific location' do\
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    background_images = JSON.parse(response.body, symbolize_names: true)[:data][:background_images]

    expect(background_images).to be_an(Array)
    expect(background_images[0]).to have_key(:alt)
    expect(background_images[0]).to have_key(:url)
  end
end
