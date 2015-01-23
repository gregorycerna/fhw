class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.belongs_to :labor, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :tasks, :labors
  end
end
