# User.create!(first_name: "Chang",
#              email: "joe@gmail.com",
#              password: "qewret123",
#              password_confirmation: "qewret123")

100.times do |n|
  first_name = Faker::Name.first_name
  user_name = "guest#{n + 1}"
  email = "example-#{n + 1}@gmail.com"
  state = Faker::Address.state
  password = "password"
  User.create!(first_name: first_name,
               user_name: user_name,
               email: email,
               state: state,
               password: password,
               password_confirmation: password)
end

# Following relationships
users = User.all
user  = users.first
following = users[30..50]
followers = users[31..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
