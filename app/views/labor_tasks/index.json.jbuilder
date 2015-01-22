json.array!(@labor_tasks) do |labor_task|
  json.extract! labor_task, :id, :description, :complete, :didLaborEvent_id
  json.url labor_task_url(labor_task, format: :json)
end
