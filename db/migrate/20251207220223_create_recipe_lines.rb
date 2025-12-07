class CreateRecipeLines < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_lines do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.float :quantity
      t.string :quantity_unit
      t.text :notes

      t.timestamps
    end
  end
end
