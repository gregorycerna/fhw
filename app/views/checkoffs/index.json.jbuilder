json.array!(@checkoffs) do |checkoff|
  json.extract! checkoff, :id, :task_id, :did_id, :complete
  json.url checkoff_url(checkoff, format: :json)
end
