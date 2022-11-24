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

grandparents_descriptions = ["Great hand of cooking, funny and friendly.", \
  "Good in baking tasty cakes, has a huge stock of goodnight stories.", \
  "Can make tasty and spicy foods, likes to go for jogging in afternoon.", \
  "Good in making different fries, good in communication and open-mided.", \
  "Always like to go for a trip with car, love to explore nature.", \
  "Like to read books and tell stories, foodlover and love to taste new foods.",\
  "Will take you for ride with his car for sure! Make you taste good food and visit new places where you were not before!", \
  "Good in making different kind of new drinks. Like to spend time and have a good conversation with new people.", \
  "Party guy! Loves to go for parties, dance and making new friends. Never feel bore!", \
  "Love nature mostly, sea is the favorite spot to visit. Love pets and spending time together."]
puts "Creating grandparents..."
30.times do
  Grandparent.create!(name: Faker::Name.name, description: grandparents_descriptions.sample, age: rand(60..85), address: Faker::Address.street_address, user: test_user)
end

puts "Seeding Finished!"

# age: Faker::Number.number(range: { within: (60..120) }, user: test_user)
