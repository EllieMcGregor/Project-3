class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  # user_signed_in?
  before_action :authenticate_user!
  respond_to :html

  def index
    # @q = FoodItem.search(params[:q])
    # @food_items = @q.result(distinct: true)
    # @recipes = Recipe.order(:created_at).page(params[:page])
    # respond_with(@food_items, @recipes)

    @q = current_user.food_items.search(params[:q])
    if params[:q]
      @food_items = @q.result(distinct: true).page(params[:page])
    else 
      @food_items = current_user.food_items.page(params[:page])
    end
    respond_with(@food_items)
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
    @food_item = current_user.food_items.new(food_item_params)
    @food_item.save
    redirect_to food_items_path
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
      params.require(:food_item).permit(:name, :expiry_date, :food_item_image, :remote_food_item_image_url, :user_id, :food_items => [])
    end
end
