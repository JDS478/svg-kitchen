class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @posts = @user.posts
    @check_user = current_user == @user
    # raise
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to current_user
    raise
  end

  private

  def user_params
    params.permit(:user).require(:bio, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
