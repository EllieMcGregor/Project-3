class FoodItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient

  has_one :nutrition, through: :ingredient
end
