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
Recipe.delete_all
Quantity.delete_all
Nutrition.delete_all
Favourite.delete_all

units = ["grams", "teaspoons", "cup", "ounce", "pint"]

foodnames = ["apple", "oranges", "chicken breast", "beef steak", "Tomatoes", "Rocket Salad", "whole chicken", "chicken stock", "salmon fillet", "Bell peppers", "Haddock"]

recipes = ["Chicken Pie", "Beef Pie", "Chicken Salad", "Beef Burrito", "Haddock and Potatoes", "Fajitas", "Salmon Curry"]



puts "Creating admin"
ellie = User.create!(first_name: "Ellie", last_name: "McGregor", email: "ellie@ga.com", password: "password", role: :admin)

puts "Creating general users"

30.times do
  user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Avatar.image}", role: :normal)
end


users = User.all
user = users.sample

puts "Creating Ingredients"

30.times do
  ingredient = Ingredient.create!(name: foodnames.sample, unit: units.sample, default_expiry_in_days: "#{Faker::Date.forward(7)}")
end

ingredients = Ingredient.all
ingredient = ingredients.sample

puts "Creating Food items"

30.times do
  food_item = FoodItem.create!(name: foodnames.sample, expiry_date: "#{Faker::Date.forward(5)}", food_item_image: "#{Faker::Avatar.image}", user: users.sample)
end

puts "Creating Recipes"

30.times do
  recipe = Recipe.create!(name: recipes.sample, method: "#{Faker::Lorem.paragraph}", desciption: "#{Faker::Lorem.paragraph}", recipe_image: "#{Faker::Avatar.image}", category: "healthy" )
end
  
recipes = Recipe.all
recipe = recipes.sample

puts "Creating Favourites"

30.times do
  favourite = Favourite.create!(recipe: recipes.sample, user: users.sample )
end

puts "Creating Nutrition"

30.times do
  nutrition = Nutrition.create!( serving: "#{Faker::Number.number(2)}", calorie: "#{Faker::Number.number(3)}", carbohydrate: "#{Faker::Number.number(2)}", sodium: "#{Faker::Number.number(1)}", fiber: "#{Faker::Number.number(1)}", protein:"#{Faker::Number.number(2)}", ingredient: ingredients.sample )
end

puts "Creating Quantities"

30.times do
  quantity = Quantity.create!(recipe: recipes.sample, ingredient: ingredients.sample, amount: "#{Faker::Number.number(1)}")
end