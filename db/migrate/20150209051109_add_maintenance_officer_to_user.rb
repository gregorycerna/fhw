class AddMaintenanceOfficerToUser < ActiveRecord::Migration
  def change
    add_column :users, :maintenance_officer, :boolean, null: false, default: false
  end
end
