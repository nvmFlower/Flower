class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :address
      t.string :phone
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
