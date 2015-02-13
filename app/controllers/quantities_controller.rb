class QuantitiesController < ApplicationController
  before_action :set_quantity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @quantities = Quantity.all
    respond_with(@quantities)
  end

  def show
    respond_with(@quantity)
  end

  def new
    @quantity = Quantity.new
    respond_with(@quantity)
  end

  def edit
  end

  def create
    @quantity = Quantity.new(quantity_params)
    @quantity.save
    respond_with(@quantity)
  end

  def update
    @quantity.update(quantity_params)
    respond_with(@quantity)
  end

  def destroy
    @quantity.destroy
    respond_with(@quantity)
  end

  private
    def set_quantity
      @quantity = Quantity.find(params[:id])
    end

    def quantity_params
      params.require(:quantity).permit(:ingredient_id, :recipe_id, :amount)
    end
end
