class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.string :address
      t.boolean :status, default: false
      t.datetime :date_order
      t.datetime :date_delivery
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
