class Category < ApplicationRecord
  has_many :workouts, inverse_of: :category, autosave: true, dependent: :destroy
  has_many :users, through: :workouts

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

end
