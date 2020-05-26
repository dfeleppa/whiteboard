class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do|t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :height
      t.integer :weight
      t.string :sex
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
