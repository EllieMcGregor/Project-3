# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Deleting all existing data"

User.delete_all
FoodItem.delete_all
Ingredient.delete_all


ellie = User.create!(first_name: "Ellie", last_name: "McGregor", email: "ellie@ga.com", password: "password", role: :admin)

50.times do
  user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Avatar.image}", role: :normal)
end


users = User.all
user = users.sample

50.times do
  ingredient = Ingredient.create!(name: "#{Faker::Name.name}", unit: "#{Faker::Name.name}",default_expiry_in_days: "#{Faker::Date.forward(7)}")
end

ingredients = Ingredient.all
ingredient = ingredients.sample

50.times do
  food_item = FoodItem.create!(name: "#{Faker::Name.title}", expiry_date: "#{Faker::Date.forward(5)}", food_item_image: "#{Faker::Avatar.image}", user: users.sample, ingredient: ingredients.sample )
end

50.times do
  recipe = Recipe.create!(name: "#{Faker::Name.title}", method: "#{Faker::Lorem.paragraph}", desciption: "#{Faker::Lorem.paragraph}", recipe_image: "#{Faker::Avatar.image}", category: "healthy" )
end

recipes = Recipe.all
recipe = recipes.sample

10.times do
  favourite = Favourite.create!(recipe: recipes.sample, user: users.sample )
end

15.times do
  nutrition = Nutrition.create!( serving: "#{Faker::Number.number(2)}", calorie: "#{Faker::Number.number(3)}", carbohydrate: "#{Faker::Number.number(2)}", sodium: "#{Faker::Number.number(1)}", fiber: "#{Faker::Number.number(1)}", protein:"#{Faker::Number.number(2)}", ingredient: ingredients.sample )
end

15.times do
  quantity = Quantity.create!(recipe: recipes.sample, ingredient: ingredients.sample, amount: "#{Faker::Number.number(1)}")
end
















