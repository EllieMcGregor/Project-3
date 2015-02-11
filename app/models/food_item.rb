class FoodItem < ActiveRecord::Base
  mount_uploader :food_item_image, FoodItemImageUploader
  belongs_to :user
  belongs_to :ingredient

  has_one :nutrition, through: :ingredient
end
