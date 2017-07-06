User.create! name: "illuminati", email: "huymanhtmhp@gmail.com",
  password: "manhtmhp123", phone: "01677661273", is_admin: true

Settings.users.seed_record.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone = Faker::PhoneNumber.phone_number
  password = "123456"
  User.create! name: name, email: email, password: password, phone: phone
end
