class ChangePartnerToUserType < ActiveRecord::Migration
  def change
    remove_column :recipes, :partner, :string
    add_column :recipes, :partner_id, :integer
  end
end
