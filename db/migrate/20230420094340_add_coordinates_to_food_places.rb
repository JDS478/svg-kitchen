class AddCoordinatesToFoodPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :food_places, :latitude, :float
    add_column :food_places, :longitude, :float
  end
end
