class ListLine < ApplicationRecord
  belongs_to :ingredient, required: true, class_name: "Ingredient", foreign_key: "ingredient_id", counter_cache: true
  belongs_to :list, required: true, class_name: "List", foreign_key: "list_id", counter_cache: true
end
