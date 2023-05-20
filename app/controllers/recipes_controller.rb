class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
<<<<<<< HEAD
    @recipes = Recipe.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    if params[:query].present?
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:query]}%").paginate(page: params[:page], per_page: 9)
=======
    @recipes = Recipe.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    if params[:query].present?
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:query]}%").paginate(page: params[:page], per_page: 5)
>>>>>>> 1061b6e58d2ad1efb3fc28d60c1328420d28c29e
    end
  end

  def show
    @reviews = @recipe.reviews
    @review = Review.new
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all.map { |cat| cat.title }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.category = Category.find_by(title: params[:recipe][:category])
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all.map {|cat| cat.title}
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
