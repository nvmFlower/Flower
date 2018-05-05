class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :img
      t.boolean :many_or_not, default: true
      t.integer :sale, default: 0
      t.text :details
      t.integer :view
      t.float :rating, default: 5
      t.integer :design_id

      t.timestamps
    end
  end
end
