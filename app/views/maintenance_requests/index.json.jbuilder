json.array!(@maintenance_requests) do |maintenance_request|
  json.extract! maintenance_request, :id, :name, :user_id, :description, :done
  json.url maintenance_request_url(maintenance_request, format: :json)
end
