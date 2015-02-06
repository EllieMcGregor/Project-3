class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :expiry_date
      t.string :food_item_image
      t.integer :user_id

      t.timestamps
    end
  end
end
