class IngredientValidator <ActiveModel::Validator
  def validate(record)
    category_list = {dairy:0, meat:1, produce:2, grains:3, other:4}
    unless category_list[record.category.to_sym]
      record.errors[:category] << "Not a given category"
    end
  end
end

class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipes
  validates_with IngredientValidator
end