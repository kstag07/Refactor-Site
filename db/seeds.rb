# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ['author', 'mod'].each do |role|
#   Role.find_or_create_by(name: role)
# end

10.times do |n|
  User.create(email: "fake#{n}@example.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: Faker::Name.first_name)
end

# @post = Post.create(title: Faker::App.name,
#   body: Faker::Lorem.paragraph,
#   author_id: rand(1..10),
#   language: %w[Ruby HTML C++ Python PHP Javascript][rand(6)])
