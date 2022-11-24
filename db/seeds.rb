# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "json"
# require "open-uri"
require "faker"

puts "Cleaning database..."
Grandparent.destroy_all
User.destroy_all

# url = "https://tmdb.lewagon.com/movie/top_rated"
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)

test_user = User.create!(email: "test@gmail.com", password: "123456")

puts "Creating grandparents..."
30.times do
  Grandparent.create!(name: Faker::Name.name, description: Faker::GreekPhilosophers.quote, age: rand(60..85), user: test_user)
end

puts "Seeding Finished!"

# age: Faker::Number.number(range: { within: (60..120) }, user: test_user)
