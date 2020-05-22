class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.integer :user_id
      t.string :workout_name
      t.integer :score
      t.string :rx
      
      t.timestamps null: false
    end
  end
end
