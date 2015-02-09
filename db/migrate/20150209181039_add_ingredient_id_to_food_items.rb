class AddIngredientIdToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :ingredient_id, :integer
  end
end
