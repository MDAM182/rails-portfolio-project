class Category < ApplicationRecord
  has_many :workouts, inverse_of: :category, autosave: true, dependent: :destroy
  has_many :users, through: :workouts

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

  # scope :arms, -> { where(name: 'Arms') }
  # scope :legs, -> { where(name: 'Legs') }
  # scope :shoulders, -> { where(name: 'Shoulders') }
  #
  # def self.category_type(type)
  #   Category.where(name: type)
  # end
end
