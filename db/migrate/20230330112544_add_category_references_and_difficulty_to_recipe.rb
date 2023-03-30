class AddCategoryReferencesAndDifficultyToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :category, foreign_key: true
    add_column :recipes, :difficulty, :integer
  end
end
