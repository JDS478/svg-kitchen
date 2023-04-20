class FoodplacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @food_places = FoodPlace.all
    @markers = @food_places.geocoded.map do |food_place|
      {
        lat: food_place.latitude,
        lng: food_place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {food_place: food_place})
      }
    end
  end
end
