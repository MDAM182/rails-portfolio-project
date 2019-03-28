class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }


  # scope :beginner, -> { where(level: 'Beginner') }
  # scope :intermediate, -> { where(level: 'Intermediate') }
  # scope :advanced, -> { where(level: 'Advanced') }
  # scope :expert, -> { where(level: 'Expert') }

end
