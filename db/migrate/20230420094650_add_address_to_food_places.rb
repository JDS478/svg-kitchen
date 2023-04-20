class AddAddressToFoodPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :food_places, :address, :string
  end
end
