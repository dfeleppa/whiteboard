# Create 2 test users
User.create(name: "Daniel", email: "daniel@daniel.com", password: "password", height: 70, weight: 205)
User.create(name: "Danielle", email: "daniel@daniel.com", password: "password", height: 70, weight: 205)

# Create 2 test user posts
UserPost.create(user_id: daniel.id, workout_name: "murph", score: 360, rx: true)
UserPost.create(user_id: danielle.id, workout_name: "murph", score: 360, rx: true)

#Pre-associate
daniel.user_post.create()