class AddDescToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :desc, :text
  end
end
