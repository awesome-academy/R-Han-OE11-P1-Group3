class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthdate
      t.boolean :is_active
      t.boolean :is_admin
      t.timestamps
    end
  end
end
