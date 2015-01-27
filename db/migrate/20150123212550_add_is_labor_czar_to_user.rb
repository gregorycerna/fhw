class AddIsLaborCzarToUser < ActiveRecord::Migration
  def change
    add_column :users, :isLaborCzar, :boolean, null: false, default: false
  end
end
