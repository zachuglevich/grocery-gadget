class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :recipe_lines_count

      t.timestamps
    end
  end
end
