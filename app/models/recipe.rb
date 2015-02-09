class Recipe < ActiveRecord::Base
  has_many :favourites
  has_many :users, through: :favourites
  
  has_many :quantities
  has_many :ingredients, through: :quantities
  
end
