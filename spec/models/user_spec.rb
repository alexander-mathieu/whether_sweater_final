# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it { should validate_presence_of :password }
    it { should have_secure_password }
  end

  describe 'instance methods' do
    it '#update_api_key' do
      user_params = { email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password' }

      user = User.create!(user_params)

      expect(user.api_key).to_not be(nil)
    end
  end
end
