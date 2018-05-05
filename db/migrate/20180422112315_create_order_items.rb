class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :unit_price
      t.integer :quantity, default: 1
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
