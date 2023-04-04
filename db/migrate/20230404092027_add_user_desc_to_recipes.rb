class AddUserDescToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :user_desc, :text
  end
end
