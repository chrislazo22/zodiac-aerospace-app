# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |specimen|
  Speciman.create!(pass_or_fail: "pass", test_plan: "4FR4132-00", cushion: "Headrest", test_plan_id: "1", seat_model:4132, test_date: Date.today, vert_burn_length_front: 1.0, vert_burn_length_back: 1.0, horiz_burn_length_top: 1.0) 
end

puts "100 items have been created"

User.create!(email: "user@user.com", first_name: "user", last_name: "1", password: "asdfasdf", password_confirmation: "asdfasdf", admin: false)

puts "created user"

User.create!(email: "admin@admin.com", first_name: "admin", last_name: "1", password: "asdfasdf", password_confirmation: "asdfasdf", admin: true)

puts "created admin user"