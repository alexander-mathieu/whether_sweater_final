# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions API endpoint' do
  before :each do
    user_params = { email: 'user@example.com',
                    password: 'password' }

    @user = User.create!(user_params)
  end

  it 'creates a session for a user when valid params are sent' do
    params = {
      email: 'user@example.com',
      password: 'password',
    }

    post api_v1_sessions_path, params: params

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:api_key]).to eq(@user.api_key)
  end

  it 'does not create a session for a user when invalid params are sent' do
    params = {
      email: 'user@example.com',
      password: 'incorrectpassword'
    }

    post api_v1_sessions_path, params: params

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:error]).to eq('Failed to authenticate user')
  end
end
