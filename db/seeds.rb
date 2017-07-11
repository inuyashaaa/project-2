User.create! name: "Admin", email: "admin@gmail.com",
  password: "123456", phone: "01677661273", is_admin: true

Settings.users.seed_record.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone = Faker::PhoneNumber.phone_number
  password = "123456"
  User.create! name: name, email: email, password: password, phone: phone
end

users = User.order(:created_at).take Settings.posts.user_taked
Settings.posts.seed_record.times do
  title = Faker::Lorem.sentence Settings.posts.title_sentence
  content = Faker::Lorem.paragraph(20)
  users.each{|user| user.posts.create!(title: title, content: content)}
end

users = User.all
user = users.first
following = users[Settings.follow.min_following..Settings.follow.max_following]
followers = users[Settings.follow.min_followers..Settings.follow.max_followers]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
