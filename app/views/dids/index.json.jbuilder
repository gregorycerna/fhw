json.array!(@dids) do |did|
  json.extract! did, :id, :time, :notes, :labor_id
  json.url did_url(did, format: :json)
end
