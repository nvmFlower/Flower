class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.text :name

      t.timestamps
    end
  end
end
