class CreateKindsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :kinds_products do |t|
      t.integer :product_id
      t.integer :kind_id

      t.timestamps
    end
  end
end
