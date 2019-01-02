class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @recipe_ingredient = @recipe.recipe_ingredients.build
    @ingredients = Ingredient.all
    @recipe.directions.build
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Successfully created recipe"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Successfully deleted recipe"
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, directions_attributes: [:id, :step, :_destroy])
  end
end
