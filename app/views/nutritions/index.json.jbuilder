json.array!(@nutritions) do |nutrition|
  json.extract! nutrition, :id, :serving, :calorie, :carbohydrate, :sodium, :fiber, :protein
  json.url nutrition_url(nutrition, format: :json)
end
