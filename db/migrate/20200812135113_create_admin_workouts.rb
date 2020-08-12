class CreateAdminWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_workouts do |t|
      t.string :admin_workout_name
      t.string :admin_workout
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    
  end
end
