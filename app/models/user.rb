class User < ApplicationRecord
  
  has_many :workouts, inverse_of: :user, autosave: true, dependent: :destroy
  has_many :categories, through: :workouts

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  # scope :all_workouts, -> {joins(:workouts).group(:workout_id).order("COUNT(*) DESC").first}

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
      self.where(email: auth_hash['info']['email']).first_or_create do |user|
      user.password = auth_hash['info']['password']
      user.username = auth_hash['info']['name']
    end
  end
end
