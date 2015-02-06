json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :method, :desciption, :recipe_image, :category
  json.url recipe_url(recipe, format: :json)
end
