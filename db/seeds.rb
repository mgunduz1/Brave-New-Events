# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all
Event.delete_all
Attendee.delete_all

80.times do |x|
  name  = Faker::Name.name
  email = "try@try#{x + 1}"
  password = '123456'
  password_confirmation = '123456'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation)
end

a = 0
50.times do
  title = Faker::Book.title
  description = Faker::Lorem.sentence(word_count: 40)
  user_id = rand(1..80)
  date = Faker::Date.between(from: '2020-10-23', to: '2022-08-20')
  attend_limit = rand(20..40)
  location = Faker::Address.city
  Event.create!(title: title,
                description: description,
                user_id: user_id,
                attend_limit: attend_limit,
                location: location,
                date: date)
a += 1
  xxx = rand(10..(attend_limit.to_i))
  xxx.times do
    u_id = rand(1..80)
    next if u_id == user_id
    next if Attendee.where(event_id: a, user_id: u_id).exists?

    Attendee.create!(event_id: a,
                     user_id: u_id)
  end
end
