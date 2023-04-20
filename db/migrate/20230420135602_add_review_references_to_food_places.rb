class AddReviewReferencesToFoodPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_places, :reviews, foreign_key: true
  end
end
