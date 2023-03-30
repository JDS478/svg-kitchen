class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @rand_recipe = Recipe.last
  end
end
