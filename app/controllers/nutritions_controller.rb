class NutritionsController < ApplicationController
  before_action :set_nutrition, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @nutritions = Nutrition.all
    respond_with(@nutritions)
  end

  def show
    respond_with(@nutrition)
  end

  def new
    @nutrition = Nutrition.new
    respond_with(@nutrition)
  end

  def edit
  end

  def create
    @nutrition = Nutrition.new(nutrition_params)
    @nutrition.save
    respond_with(@nutrition)
  end

  def update
    @nutrition.update(nutrition_params)
    respond_with(@nutrition)
  end

  def destroy
    @nutrition.destroy
    respond_with(@nutrition)
  end

  private
    def set_nutrition
      @nutrition = Nutrition.find(params[:id])
    end

    def nutrition_params
      params.require(:nutrition).permit(:serving, :calorie, :carbohydrate, :sodium, :fiber, :protein)
    end
end
