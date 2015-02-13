class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @ingredients = Ingredient.all    
    @q = Ingredient.search(params[:q])
    @ingredients = @q.result(distinct: true)

    respond_with(@ingredient)
  end

  def show
    respond_with(@ingredient)
  end


  def new
    @ingredient = Ingredient.new
    respond_with(@ingredient)
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    respond_with(@ingredient)
  end

  def update
    @ingredient.update(ingredient_params)
    respond_with(@ingredient)
  end

  def destroy
    @ingredient.destroy
    respond_with(@ingredient)
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :unit, :default_expiry_in_days)
    end
end
