class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    # @recipes = Recipe.all
    
    if params[:q] && params[:q][:name_cont_any]
      params[:q][:name_cont_any] = params[:q][:name_cont_any].split
    end

    @q = Recipe.search(params[:q])
    if params[:q]
      @recipes = @q.result.includes(:ingredients).page(params[:page])
    else
      @recipes = Recipe.order(:created_at).page(params[:page])
    end
    respond_with(@recipes)
  end

  def show
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :method, :desciption, :recipe_image, :category)
    end
end
