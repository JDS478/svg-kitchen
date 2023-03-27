class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def show
    @recipe = params[:id]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.delete
    redirect_to user_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipes).permit(:title, :ingredients, :content)
  end
end
