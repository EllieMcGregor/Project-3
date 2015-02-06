class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.references :ingredient
      t.references :recipe
      t.integer :amount

      t.timestamps
    end
  end
end
