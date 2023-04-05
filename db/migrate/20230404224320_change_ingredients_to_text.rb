class ChangeIngredientsToText < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :ingredients, :text, array: true
    add_column :recipes, :ingredients, :text
  end
end
