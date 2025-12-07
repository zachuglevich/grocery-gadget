class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :list_lines_count

      t.timestamps
    end
  end
end
