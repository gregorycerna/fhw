class Labor < ActiveRecord::Base
  belongs_to :user
  has_many :did_labor_events

  def labor_tasks
    did_labor_events.each { |x| x.labor_tasks }
  end
end
