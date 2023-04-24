class PlacereviewsController < ApplicationController
  def create
    @fp_review = FoodPlace.new(place_review_params)
  end

  private

  def place_review_params
    params.require(:place_review).permit
  end
end
