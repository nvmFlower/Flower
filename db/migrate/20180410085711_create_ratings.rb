class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :star_number
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
