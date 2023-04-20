class FoodplacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @food_places = FoodPlace.all
    @markers = @food_places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end
end
