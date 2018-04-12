class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.date :date_start
      t.date :date_end
      t.references :occasion, index: true, foreign_key: true

      t.timestamps
    end
  end
end
