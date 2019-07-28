# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_secure_password

  after_create :update_api_key

  private

  def update_api_key
    update(api_key: SecureRandom.hex)
  end
end
