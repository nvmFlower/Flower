class CreateTypeFlowers < ActiveRecord::Migration[5.1]
  def change
    create_table :type_flowers do |t|
      t.string :name

      t.timestamps
    end
  end
end
