json.array!(@quantities) do |quantity|
  json.extract! quantity, :id, :ingredient_id, :recipe_id, :amount
  json.url quantity_url(quantity, format: :json)
end
