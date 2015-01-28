User.create!(name:  "Ta Thi Thuy",
             email: "tathithuy2711@gmail.com",
             password:              "tathithuy",
             password_confirmation: "tathithuy",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
                             activated: true,
               activated_at: Time.zone.now)
end
 
# # Following relationships
# users = User.all
# user  = users.first
# following = users[2..10]
# followers = users[3..20]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }


