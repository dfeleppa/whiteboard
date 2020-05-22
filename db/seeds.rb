# Create 2 test users
daniel = User.create(name: "Daniel", email: "daniel@daniel.com", password: "password", height: 70, weight: 205, sex: "male")
jen = User.create(name: "Jen", email: "daniel@daniel.com", password: "password", height: 70, weight: 205, sex: "female")

# Create 2 test user posts
UserPost.create(user_id: daniel.id, workout_name: "murph", score: 360, rx: true)
UserPost.create(user_id: jen.id, workout_name: "murph", score: 347, rx: true)