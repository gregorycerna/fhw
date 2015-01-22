class Did < ActiveRecord::Base
  belongs_to :labor
  has_many :checkoffs
end
