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
  user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Food.image}", role: :normal)
end

ingredients = Ingredient.all
ingredient = ingredients.sample
users = User.all
user = users.sample

50.times do
  ingredient = Ingredient.create!(name: "#{Faker::Name.name}", unit: "#{Faker::Name.name}",default_expiry_in_days: "#{Faker::Date.forward(7)}")
end

50.times do
  food_item = FoodItem.create!(name: "#{Faker::Name.title}", expiry_date: "#{Faker::Date.forward(5)}", food_item_image: "#{Faker::Food.image}", user: users.sample, ingredient: ingredients.sample )
end
















