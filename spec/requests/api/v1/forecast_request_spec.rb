require 'rails_helper'

RSpec.describe 'Forecast API endpoint' do
  it 'delivers the forecast for a specific location' do\
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast).to have_key(:currently)
    expect(forecast).to have_key(:hourly)
    expect(forecast).to have_key(:daily)

    expect(forecast[:hourly].count).to eq(8)
    expect(forecast[:daily].count).to eq(5)
  end
end
