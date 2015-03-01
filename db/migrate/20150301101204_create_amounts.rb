class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.integer :count
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :amounts, :ingredients
    add_foreign_key :amounts, :recipes
  end
end
