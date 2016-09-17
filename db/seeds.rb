require 'faker'
User.delete_all
Potluck.delete_all
Attendance.delete_all

20.times do
  User.create(email: Faker::Internet.free_email, username: Faker::Name.first_name, password: "password")
end

20.times do
  Potluck.create(name: Faker::University.name, location: "Wicker Park", time: "2017-05-22 12:00", user_id: rand(20))
end

20.times do
  Attendance.create(dish: Faker::Lorem.paragraph, potluck_id: rand(20), user_id: rand(20))
end
