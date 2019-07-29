# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'Munchies API endpoint' do
  it 'delivers a list of restaurants that will be open at arrival time when a valid api key is sent' do

  end

  it 'returns 401 when an invalid api key is sent' do
    params = {
      start: 'denver,co',
      end: 'pueblo,co',
      food: 'chinese',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    post api_v1_munchies_path, params: params

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:error]).to eq('Unauthorized API key')
  end
end

# GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json
#
# You will use the Google Directions API: https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then using
# the Yelp API, you will find all of the restaurants matching the cuisine, the example here is Chinese,
# that WILL BE OPEN at your estimated time of arrival.
#
# Your API will return the end city, and three restaurants, along with their name and address.
#
# Technical notes:
#
# The Yelp API only accepts time as UNIX time. You can conert a Time object into UNIX time
# by doing something like this: Time.now.to_i
#
# You can find out time in the future using a feature built into Rails' ActiveSupport which
# will let you do things like this: Time.now + 4.hours (This will ONLY work in Rails and not a pry session run from the command line)
