class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.string :name, null: false
      t.string :description
      t.references :user, index: true, null: false
      t.string :dueday

      t.timestamps null: false
    end
    add_foreign_key :labors, :users

    Recipe.all.each do |rec|
      rec.user = User.first
      rec.save!
    end
    change_column_null :recipes, :user_id, false
  end
end
