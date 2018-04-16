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
      t.integer :rating
      t.references :design, index: true, foreign_key: true
      t.timestamps
    end
  end
end
