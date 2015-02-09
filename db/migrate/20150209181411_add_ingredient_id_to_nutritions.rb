class AddIngredientIdToNutritions < ActiveRecord::Migration
  def change
    add_column :nutritions, :ingredient_id, :integer
  end
end
