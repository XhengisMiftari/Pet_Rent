# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Reservation.destroy_all
Pet.destroy_all
User.destroy_all
require 'faker'

users = 5.times.map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.unique.email,
    password:   "password"
  )
end

pets = 10.times.map do
  Pet.create!(
    species: Faker::Creature::Animal.name,
    name: Faker::Name.first_name,
    price: rand(50..500),
    location: Faker::Address.city,
    availability: [true, false].sample,
    user: users.sample
  )
end

15.times do
  Reservation.create!(
    user: users.sample,
    pet: pets.sample,
    start_date: Faker::Date.forward(days: 10),
    end_date:   Faker::Date.forward(days: 20)
  )
end

puts "Seeded 5 users and 10 pets and 15 reservations."
