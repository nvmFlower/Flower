class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :price
      t.text :img
      t.integer :many_or_not
      t.integer :sale
      t.text :details
      t.integer :view
      t.integer :rating
      t.references :design, index: true, foreign_key: true

      t.timestamps
    end
  end
end
