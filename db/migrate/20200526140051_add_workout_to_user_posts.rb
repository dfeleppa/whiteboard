class AddWorkoutToUserPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_posts, :workout, :string
  end
end
