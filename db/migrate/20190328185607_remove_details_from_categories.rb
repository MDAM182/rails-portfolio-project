class RemoveDetailsFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :workout_id, :integer
    remove_column :categories, :user_id, :integer
  end
end
