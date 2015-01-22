class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :user, index: true, null: false
      t.string :dueday, null: false

      t.timestamps null: false
    end
    add_foreign_key :labors, :users
  end
end
