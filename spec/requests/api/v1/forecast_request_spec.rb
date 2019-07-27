require 'rails_helper'

RSpec.describe 'Forecast API endpoint' do
  it 'delivers the forecast for a specific location' do\
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
