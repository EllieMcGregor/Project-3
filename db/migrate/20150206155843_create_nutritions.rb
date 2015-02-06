class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.integer :serving
      t.integer :calorie
      t.integer :carbohydrate
      t.integer :sodium
      t.integer :fiber
      t.integer :protein

      t.timestamps
    end
  end
end
