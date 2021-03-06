# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150306121929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourites", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favourites", ["recipe_id"], name: "index_favourites_on_recipe_id", using: :btree
  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id", using: :btree

  create_table "food_items", force: true do |t|
    t.string   "name"
    t.integer  "expiry_date"
    t.string   "food_item_image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingredient_id"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "default_expiry_in_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nutritions", force: true do |t|
    t.integer  "serving"
    t.integer  "calorie"
    t.integer  "carbohydrate"
    t.integer  "sodium"
    t.integer  "fiber"
    t.integer  "protein"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingredient_id"
  end

  create_table "quantities", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "method"
    t.string   "name"
    t.string   "recipe_image"
    t.string   "category"
    t.string   "desciption"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "user_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
