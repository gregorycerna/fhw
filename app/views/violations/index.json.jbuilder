json.array!(@violations) do |violation|
  json.extract! violation, :id, :description, :labor_id, :amount_due, :date_settled
  json.url violation_url(violation, format: :json)
end
