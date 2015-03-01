class MaintenanceRequest < ActiveRecord::Base
  belongs_to :user
  def self.dones
    all.select { |x| x.done }
  end
  def self.not_dones
    all.select { |x| !x.done }
  end
end
