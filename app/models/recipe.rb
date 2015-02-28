class Recipe < ActiveRecord::Base
  belongs_to :owner, class_name => 'User'
  belongs_to :partner, class_name => 'User'
end
