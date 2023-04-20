class FoodplacesController < ApplicationController

  def index
    @food_places = FoodPlaces.all
    @markers = @food_places.geocoded.map do |place|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
