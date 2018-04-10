class CreateDetailBills < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_bills do |t|
      t.integer :count
      t.integer :price
      t.references :bill, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
