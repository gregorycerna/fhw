class DidLaborEvent < ActiveRecord::Base
  belongs_to :labor
  has_many :labor_tasks
end
