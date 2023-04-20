class FoodplacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

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


  def show
    @food_place = FoodPlace.find(params[:id])
    @food_place_review = FoodPlaceReview.new
  end
end
