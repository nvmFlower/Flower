class CreateProductOccasions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_occasions do |t|
      t.references :product, index: true, foreign_key: true
      t.references :occasion, index: true, foreign_key: true

      t.timestamps
    end
  end
end
