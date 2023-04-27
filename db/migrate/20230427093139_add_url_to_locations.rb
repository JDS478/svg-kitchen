class AddUrlToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :img_url, :string
  end
end
