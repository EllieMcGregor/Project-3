json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :unit, :default_expiry_in_days
  json.url ingredient_url(ingredient, format: :json)
end
