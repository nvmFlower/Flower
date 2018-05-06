class CreateOccasionsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :occasions_products do |t|
      t.integer :product_id
      t.integer :occasion_id

      t.timestamps
    end
  end
end
