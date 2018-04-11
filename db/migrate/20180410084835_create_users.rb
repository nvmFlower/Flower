class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password_digest
      t.text :address
      t.text :phone
      t.boolean :is_admin

      t.timestamps
    end
  end
end
