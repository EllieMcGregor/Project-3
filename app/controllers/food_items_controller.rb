class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # user_signed_in?
  
  respond_to :html

  def index

    @food_items = FoodItem.all
    respond_with(@food_items)
    # @food_items = FoodItem.all
    
  end

  def show
    respond_with(@food_item)
  end

  def new
    @food_item = FoodItem.new
    respond_with(@food_item)
  end

  def edit
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.save
    respond_with(@food_item)
  end

  def update
    @food_item.update(food_item_params)
    respond_with(@food_item)
  end

  def destroy
    @food_item.destroy
    respond_with(@food_item)
  end

  private
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:name, :expiry_date, :food_item_image, :remote_food_item_image_url, :user_id)
    end
end
