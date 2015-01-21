class ChangeDatetimeToDateRecipe < ActiveRecord::Migration
  def change
    change_column :recipes, :date_to_serve, :date
  end
end
