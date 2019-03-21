class WorkoutCategory < ApplicationRecord
  belongs_to :workout
  belongs_to :category
  scope :beginner, -> { where(level: 'Beginner') }
  scope :intermediate, -> { where(level: 'Intermediate') }
  scope :advanced, -> { where(level: 'Advanced') }
  scope :expert, -> { where(level: 'Expert') }

  validates :level, presence: true
end
