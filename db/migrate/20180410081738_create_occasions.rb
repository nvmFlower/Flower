class CreateOccasions < ActiveRecord::Migration[5.1]
  def change
    create_table :occasions do |t|
      t.text :name

      t.timestamps
    end
  end
end
