class CreateDidLaborEvents < ActiveRecord::Migration
  def change
    create_table :did_labor_events do |t|
      t.datetime :time, null: false
      t.references :labor, index: true, null: false
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :did_labor_events, :labors
  end
end
