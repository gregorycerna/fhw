class Did < ActiveRecord::Base
  belongs_to :labor
  has_many :checkoffs
  accepts_nested_attributes_for :checkoffs
end
