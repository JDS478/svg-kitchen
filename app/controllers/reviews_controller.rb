class ReviewsController < ApplicationController
  def create
    # raise
    @review = Review.new(review_params)
    @review.recipe = Recipe.find(params[:recipe_id])
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@review.recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
