json.array!(@did_labor_events) do |did_labor_event|
  json.extract! did_labor_event, :id, :time, :labor_id, :notes
  json.url did_labor_event_url(did_labor_event, format: :json)
end
