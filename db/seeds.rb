# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             role:  "entrepreneur")

3.times do |n|
  name  = Faker::Name.name
  email = "example00-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role:  "entrepreneur")
end

3.times do |n|
  name  = Faker::Name.name
  email = "example01-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: "programmer")
end

3.times do |n|
  name  = Faker::Name.name
  email = "example02-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: "designer")
end


# users = User.order(:created_at).take(10)
#   content = Faker::Lorem.sentence(10)
#   users.each { |user| user.profile.create!(content: content) }


users = User.order(:created_at).take(4)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.micropost.create!(content: content) }
