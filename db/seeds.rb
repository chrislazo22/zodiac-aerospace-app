User.create!(email: "user@user.com", first_name: "user", last_name: "account", password: "asdfasdf", password_confirmation: "asdfasdf", admin: false)

puts "created user"

User.create!(email: "admin@admin.com", first_name: "admin", last_name: "account", password: "asdfasdf", password_confirmation: "asdfasdf", admin: true)

puts "created admin user"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'fireblocking_data_test.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  workout_hash = row.to_hash
  workout = Workout.where(id: workout_hash["id"])

  if workout.count == 1
    workout.first.update_attributes.(workout_hash)
  else
    Workout.create!(workout_hash)
  end
end

puts "#{Workout.count}"