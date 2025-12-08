class Recipe < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :recipe_lines, class_name: "RecipeLine", foreign_key: "recipe_id", dependent: :destroy
  #validations
  validates :name, presence: true
end
