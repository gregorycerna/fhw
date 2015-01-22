class CreateCheckoffs < ActiveRecord::Migration
  def change
    create_table :checkoffs do |t|
      t.references :task, index: true, null: false
      t.belongs_to :did, index: true, null: false
      t.boolean :complete, null: false

      t.timestamps null: false
    end
    add_foreign_key :checkoffs, :tasks
    add_foreign_key :checkoffs, :dids
  end
end
