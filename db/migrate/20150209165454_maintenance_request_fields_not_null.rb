class MaintenanceRequestFieldsNotNull < ActiveRecord::Migration
  def change
    change_column_null :maintenance_requests, :name, false
    change_column_null :maintenance_requests, :user_id, false
    change_column_null :maintenance_requests, :done, false
    change_column_default :maintenance_requests, :done, false
  end
end
