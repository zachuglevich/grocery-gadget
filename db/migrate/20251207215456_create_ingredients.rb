class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :list_lines_count
      t.integer :recipe_lines_count

      t.timestamps
    end
  end
end
