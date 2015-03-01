class AddPriceToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :price, :decimal, precision: 5, scale: 2
  end
end
