class List < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :list_lines, class_name: "ListLine", foreign_key: "list_id", dependent: :destroy
  #validations
  validates :name, presence: true
end
