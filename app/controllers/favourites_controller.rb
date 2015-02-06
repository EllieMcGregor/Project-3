class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favourites = Favourite.all
    respond_with(@favourites)
  end

  def show
    respond_with(@favourite)
  end

  def new
    @favourite = Favourite.new
    respond_with(@favourite)
  end

  def edit
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.save
    respond_with(@favourite)
  end

  def update
    @favourite.update(favourite_params)
    respond_with(@favourite)
  end

  def destroy
    @favourite.destroy
    respond_with(@favourite)
  end

  private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    def favourite_params
      params.require(:favourite).permit(:recipe_id, :user_id)
    end
end
