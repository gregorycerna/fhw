class Labor < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :dids, -> { order 'time' }
  has_many :violations
end
