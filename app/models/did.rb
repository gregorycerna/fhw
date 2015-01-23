class Did < ActiveRecord::Base
  belongs_to :labor
  has_many :checkoffs
  accepts_nested_attributes_for :checkoffs
  def completes
    checkoffs.select { |x| x.complete }
  end
  def incompletes
    checkoffs.select { |x| !x.complete }
  end
  def incomplete
    incompletes.count > 0
  end
end
