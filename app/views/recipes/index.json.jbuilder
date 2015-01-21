json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :url, :date_to_serve, :user_id, :partner, :ingredients
  json.url recipe_url(recipe, format: :json)
end
