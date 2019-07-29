# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Munchies API endpoint' do
  it 'delivers a list of restaurants that will be open at arrival time when a valid api key is sent' do
    user_params = { email: 'user@example.com',
                    password: 'password' }

    user = User.create!(user_params)

    params = {
      start: 'denver,co',
      end: 'pueblo,co',
      food: 'chinese',
      api_key: user.api_key
    }

    get api_v1_munchies_path, params: params

    munchies = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(munchies[:destination]).to eq('Pueblo, CO')
    expect(munchies[:food]).to eq('chinese')

    expect(munchies).to have_key(:open_restaurants)
    expect(munchies[:open_restaurants].count).to eq(3)
    expect(munchies[:open_restaurants].first).to have_key(:name)
    expect(munchies[:open_restaurants].first).to have_key(:address)
  end

  it 'returns 401 when an invalid api key is sent' do
    params = {
      start: 'denver,co',
      end: 'pueblo,co',
      food: 'chinese',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    get api_v1_munchies_path, params: params

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:error]).to eq('Unauthorized API key')
  end
end
