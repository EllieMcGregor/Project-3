json.array!(@food_items) do |food_item|
  json.extract! food_item, :id, :name, :expiry_date, :food_item_image, :user_id
  json.url food_item_url(food_item, format: :json)
end
