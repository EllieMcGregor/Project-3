class Recipe < ActiveRecord::Base
  has_many :favourites
  has_many :users, through: :favourites
  
  has_many :quantities
  has_many :ingredients, through: :quantities
  
  def favourite
    type = params[:type]
    if type == "favourite"
      current_user.favourites << @recipe
      redirect_to :back, notice: 'You favourited #{@recipe.name}'

    elsif type == "unfavorite"
      current_user.favourites.delete(@recipe)
      redirect_to :back, notice: 'Unfavourited #{@recipe.name}'

    else
        # Type missing, nothing happens
        redirect_to :back, notice: 'Nothing happened.'
      end
    end
  end
