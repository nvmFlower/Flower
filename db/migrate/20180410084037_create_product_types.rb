class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|
      t.references :product, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps
    end
  end
end
