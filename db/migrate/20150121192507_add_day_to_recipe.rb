class AddDayToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :day, :string
    Recipe.all.each do |rec|
      rec.day = 'Monday'
      rec.save!
    end
    change_column :recipes, :day, :string, null: false
  end

  def self.down
    remove_column :recipes, :day
  end
end
