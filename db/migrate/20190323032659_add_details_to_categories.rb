class AddDetailsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :level, :string
    add_column :categories, :user_id, :integer
    add_column :categories, :workout_id, :integer
  end
end
