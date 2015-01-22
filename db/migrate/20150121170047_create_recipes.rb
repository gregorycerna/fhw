class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.datetime :date_to_serve
      t.references :user, index: true
      t.string :partner, null: false
      t.text :ingredients, null: false
      t.timestamps null: false
    end
    add_foreign_key :recipes, :users

  end
end
