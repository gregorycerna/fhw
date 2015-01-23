class ChangeUserNameNotNull < ActiveRecord::Migration
  def change
    User.all.each do |u|
      u.name = "DEFAULT"
      u.save!
    end
    change_column_null :users, :name, false
  end
end
