# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do  users = User.create!(
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	user_name: Faker::Hacker.adjective,
	email: Faker::Internet.email,
	password:"helloworld",
	password_confirmation:"helloworld",
	)
end


users = User.all

40.times do applications = Application.create!(
	name: Faker::Hipster.words(4),
	url: Faker::Internet.domain_name,
	user: users.sample
	)
end

applications = Application.all

puts "#{User.count} Users created"
puts "#{Application.count} Applications created"