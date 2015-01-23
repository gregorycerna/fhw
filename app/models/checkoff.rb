class Checkoff < ActiveRecord::Base
  belongs_to :task
  belongs_to :did
end
