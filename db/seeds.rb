# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do  

	users = User.create!(
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	user_name: Faker::Hacker.adjective,
	email: Faker::Internet.email,
	password:"helloworld",
	password_confirmation:"helloworld",
	)
end
users = User.all

40.times do 

	applications = Application.create!(
		name: Faker::Hipster.sentence,
		url: Faker::Internet.domain_name,
		user: users.sample
	)
end
applications = Application.all

200.times do 

	events = Event.create!(
		name: Faker::Hacker.say_something_smart,
		application: applications.sample
	)
end

events = Event.all

	admin = User.create!(
		first_name: "John",
		last_name: "Carter",
		user_name: "OccamsKatana",
		email: "johngallweycarter@gmail.com",
		password: "msghguua1!",
		password_confirmation: "msghguua1!",
		role: "admin"
		)

	member = User.create!(
		first_name: "Alfred",
		last_name: "Coholic",
		user_name: "Alcoholic",
		email: "fuckyou@alcoholic.com",
		password: "msghguua1!",
		password_confirmation: "msghguua1!"
		)

puts "#{member.user_name} created as member account with password of msghguua1!"
puts "#{admin.user_name} admin account created with password of msghguua1!"
puts "#{User.count} Users created"
puts "#{Application.count} Applications created"
puts "#{Event.count} Events Created"