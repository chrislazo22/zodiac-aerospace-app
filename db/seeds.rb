User.create!(email: "user@user.com", first_name: "user", last_name: "account", password: "asdfasdf", password_confirmation: "asdfasdf", admin: false)

puts "created user"

User.create!(email: "admin@admin.com", first_name: "admin", last_name: "account", password: "asdfasdf", password_confirmation: "asdfasdf", admin: true)

puts "created admin user"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'fireblocking_data.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  data_hash = row.to_hash
  data = Speciman.where(id: data_hash["id"])

  if data.count == 1
    data.first.update_attributes.(workout_hash)
  else
    Speciman.create!(data_hash)
  end
end

puts "#{Speciman.count}"