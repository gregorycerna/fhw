json.array!(@labors) do |labor|
  json.extract! labor, :id, :name, :description, :user_id, :dueday
  json.url labor_url(labor, format: :json)
end
