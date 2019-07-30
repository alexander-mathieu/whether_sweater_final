# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_secure_password

  before_create :create_api_key

  private

  def create_api_key
    self.api_key = SecureRandom.hex
  end
end
