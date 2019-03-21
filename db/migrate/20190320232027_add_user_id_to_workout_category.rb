class AddUserIdToWorkoutCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_categories, :user_id, :integer

  end
end
