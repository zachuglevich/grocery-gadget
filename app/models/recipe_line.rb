class RecipeLine < ApplicationRecord
  belongs_to :ingredient, required: true, class_name: "Ingredient", foreign_key: "ingredient_id", counter_cache: true
  belongs_to :recipe, required: true, class_name: "Recipe", foreign_key: "recipe_id", counter_cache: true
end
