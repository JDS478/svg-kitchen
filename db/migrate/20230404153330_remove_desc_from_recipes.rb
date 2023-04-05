class RemoveDescFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :desc, :text
  end
end
