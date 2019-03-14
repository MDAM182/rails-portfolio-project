class User < ApplicationRecord
  has_many :workouts, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
      self.where(email: auth_hash['info']['email']).first_or_create do |user|
      user.password = auth_hash['info']['password']
      user.username = auth_hash['info']['name']
    end
  end
end
