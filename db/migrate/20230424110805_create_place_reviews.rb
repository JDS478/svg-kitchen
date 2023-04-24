class CreatePlaceReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :place_reviews do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :food_place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
