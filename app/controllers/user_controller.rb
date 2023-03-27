class UserController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[show]

  def show
  end

  private

  def set_user
    @user = User.find(params:[id])
  end
end
