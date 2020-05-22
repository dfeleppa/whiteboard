class CreateUserPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_posts do |t|
      t.integer :user_id
      t.string :workout_name
      t.integer :score
      t.boolean :rx
      
      t.timestamps null: false
    end
  end
end
