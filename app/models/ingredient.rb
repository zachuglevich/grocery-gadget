class Ingredient < ApplicationRecord
  has_many  :list_lines, class_name: "ListLine", foreign_key: "ingredient_id", dependent: :destroy
  has_many  :recipe_lines, class_name: "RecipeLine", foreign_key: "ingredient_id", dependent: :destroy
end
