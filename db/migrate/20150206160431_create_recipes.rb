class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :method
      t.text :desciption
      t.string :recipe_image
      t.string :category

      t.timestamps
    end
  end
end
