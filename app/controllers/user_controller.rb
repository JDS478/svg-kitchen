class UserController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[show]

  def show
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.permit(:user).require(:first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params:[id])
  end
end
