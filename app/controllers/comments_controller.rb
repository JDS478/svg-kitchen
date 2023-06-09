class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.location = Location.find(params[:location_id])
    if @comment.save
      redirect_to location_path(@comment.location)
    else
      render locations: :show, status: :unproccessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @location = Location.find(@comment.location.id)
    @comment.destroy

    redirect_to location_path(@location)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
