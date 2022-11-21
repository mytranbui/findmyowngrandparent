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

# url = "https://tmdb.lewagon.com/movie/top_rated"
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)

puts "Creating grandparents..."

100.times do
  Grandparent.create(name: Faker::Name.name, description: Faker::TvShows::BreakingBad.episode, age: Faker::Number.number(digits: 3), user_id:1)
end

puts "Seeding Finished!"
