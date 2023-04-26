class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @food_places = Location.all
    @markers = @food_places.geocoded.map do |food_place|
      {
        lat: food_place.latitude,
        lng: food_place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {food_place: food_place})
      }
    end
  end


  def show
    @location = Location.find(params[:id])
    @comment = Comment.new
    @comments = @location.comments

    @user_comments = Comment.where(user_id: current_user.id) if user_signed_in?
  end

end
