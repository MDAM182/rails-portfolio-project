class AddLevelToWorkoutCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_categories, :level, :string
  end
end
