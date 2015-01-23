class CreateDids < ActiveRecord::Migration
  def change
    create_table :dids do |t|
      t.datetime :time, null: false
      t.string :notes
      t.belongs_to :labor, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :dids, :labors
  end
end
