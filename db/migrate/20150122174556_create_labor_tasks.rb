class CreateLaborTasks < ActiveRecord::Migration
  def change
    create_table :labor_tasks do |t|
      t.string :description, null: false
      t.boolean :complete, null: false, default: false
      t.references :did_labor_event, index: true # nullable for attachment direct to Labor

      t.timestamps null: false
    end
    add_foreign_key :labor_tasks, :did_labor_events
  end
end
