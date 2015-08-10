# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Hancle Yan",
             email: "hancleyan@gmail.com",
             password:              "ywh911129",
             password_confirmation: "ywh911129",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Web Yan",
             email: "webyan@gmail.com",
             password:              "ywb911129",
             password_confirmation: "ywb911129",
             activated: true,
             activated_at: Time.zone.now)

48.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

TagLib.create!(tag: "summer_programs")
TagLib.create!(tag: "scholarships")
TagLib.create!(tag: "stem")
TagLib.create!(tag: "humanities")
TagLib.create!(tag: "computer_science")
TagLib.create!(tag: "traveling")
TagLib.create!(tag: "community_service")
TagLib.create!(tag: "research")
TagLib.create!(tag: "internships")
TagLib.create!(tag: "arts")