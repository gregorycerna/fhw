class RemoveRecipePartner < ActiveRecord::Migration
  def change
    remove_reference :recipes, :owner, index: true
    remove_foreign_key :recipes, :owners

    remove_reference :recipes, :partner, index: true
    remove_foreign_key :recipes, :partners

    add_reference :recipes, :user, index: true
    add_foreign_key :recipes, :users
  end
end
