class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.string :description, null: false
      t.references :labor, index: true, null: false
      t.integer :amount_due, null: false, default: zero
      t.datetime :date_settled    # default value 'nil' represents "not settled yet"

      t.timestamps null: false
    end
    add_foreign_key :violations, :labors
  end
end
