class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    # @favourites = Favourite.all
    @favourites = current_user.favourites
    respond_with(@favourites)
  end

  def show
    respond_with(@favourite)
  end



  def create
    @favourite = current_user.favourites.create(favourite_params)

    @favourite.save
    redirect_to recipes_path, {notice: "Added to Favourites"}
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
