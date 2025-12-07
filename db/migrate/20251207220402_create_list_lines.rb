class CreateListLines < ActiveRecord::Migration[8.0]
  def change
    create_table :list_lines do |t|
      t.integer :ingredient_id
      t.integer :list_id
      t.float :quantity
      t.string :quantity_unit
      t.text :notes
      t.boolean :in_stock_flag
      t.boolean :in_cart_flag

      t.timestamps
    end
  end
end
