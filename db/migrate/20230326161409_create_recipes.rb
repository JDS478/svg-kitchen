class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :content
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
