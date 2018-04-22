class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :total_money
      t.date :date_order
      t.date :date_delivery
      t.boolean :status, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
