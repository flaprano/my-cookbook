class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_collections, only: [:new, :edit]
  before_action :find_recipe, only: [:show, :edit, :update]
  before_action :recipe_belong_to_user, only: [:edit, :update]

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render :new
    end
  end

  def search
    @search_term = params[:search]
    @recipes = []
    unless @search_term.strip.empty?
      #@recipes = Recipe.where("title = ?", title: @search_term)
      @recipes = Recipe.where('title like ?', "%#{@search_term}%")
    end
  end

  def my_recipes
    @recipes = current_user.recipes
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                  :cook_time, :ingredients, :method)
  end

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_belong_to_user
    redirect_to root_path unless current_user.recipes.include? @recipe
  end

end
