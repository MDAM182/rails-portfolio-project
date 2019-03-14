class Category < ApplicationRecord
  has_many :workout_categories
  has_many :workouts, through: :workout_categories


  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name


end
