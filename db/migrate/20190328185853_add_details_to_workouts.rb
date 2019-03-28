class AddDetailsToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :category_id, :integer
    add_column :workouts, :level, :string
  end
end
