Faker::Config.locale="ny"
exp = ['None','Beginner','Intermediate','Expert']
gender_array = ['male','female']
relationship = ['Single','In Relationship','Married']
# Activity.create([
#   {name: 'Weight Lifting'},
#   {name: 'Running'},
#   {name: 'Cycling'},
#   {name: 'Yoga'},
#   {name: 'Dancing'},
#   {name: 'Hiking'},
#   {name: 'Pilate'},
#   {name: 'Basketball'},
#   {name: 'Tennis'},
#   {name: 'Soccer'},
#   {name: 'Walking'}
# ])

100.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = "#{first_name}#{last_name}"
  email = "#{first_name}.#{last_name}@gmail.com"
  gender = gender_array.sample
  partner_gender = gender_array.sample
  relationship_status = relationship.sample
  age = Faker::Number.between(18, 60)
  state = 'NY'
  city = Faker::Address.city
  zip_code = Faker::Address.zip_code('NY')
  password = 'password'
  user_exp = exp.sample
  bio = Faker::Lorem.sentence(3, true)
  activity_ids = Activity.all.map(&:id)

  user = User.create!(first_name: first_name,
               last_name: last_name,
               user_name: user_name,
               email: email,
               age: age,
               gender: gender,
               partner_gender: partner_gender,
               relationship_status: relationship_status,
               state: state,
               city: city,
               zip_code: zip_code,
               user_exp: user_exp,
               bio: bio,
               password: password,
               password_confirmation: password)
  random_id = activity_ids.sample
  if random_id == activity_ids.last
    random_id = activity_ids[activity_ids.size - 2]
  end
  UserActivity.create!(user_id: user.id,
                       activity_id: random_id
  )
  UserActivity.create!(user_id: user.id,
                       activity_id: random_id + 1
  )
end

# Following relationships
# users = User.all
# user  = users[217]
# following = users[200..250]
# followers = users[250..300]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
