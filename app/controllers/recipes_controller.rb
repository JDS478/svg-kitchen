class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @recipes = Recipe.all.shuffle
  end

  def show
    @reviews = @recipe.reviews
    @review = Review.new
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all.map {|cat| cat.title}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.category = Category.find_by(title: params[:recipe][:category])
    # raise
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.delete
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :content, :user_desc, :difficulty, :photo)
  end
end
