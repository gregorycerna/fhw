class AddUserRefToRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :partner_id
    remove_column :recipes, :owner_id

    add_reference :recipes, :owner, index: true
    add_foreign_key :recipes, :owners

    add_reference :recipes, :partner, index: true
    add_foreign_key :recipes, :partners
  end
end
