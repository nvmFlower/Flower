class CreateColorsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :colors_products do |t|
      t.integer :product_id
      t.integer :color_id

      t.timestamps
    end
  end
end
