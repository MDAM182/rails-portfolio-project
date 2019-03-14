class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_categories
  has_many :categories, through: :workout_categories


  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
