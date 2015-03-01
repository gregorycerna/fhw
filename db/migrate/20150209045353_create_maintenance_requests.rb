class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.string :name
      t.references :user, index: true
      t.text :description
      t.boolean :done

      t.timestamps null: false
    end
    add_foreign_key :maintenance_requests, :users
  end
end
