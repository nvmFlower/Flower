class CreateDesigns < ActiveRecord::Migration[5.1]
  def change
    create_table :designs do |t|
      t.text :name

      t.timestamps
    end
  end
end
