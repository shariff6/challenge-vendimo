# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# Generate fake data for Furnishing model
10.times do
  property = Property.order("RANDOM()").first
  description = Faker::Lorem.sentence(word_count: 6)
  Furnishing.create(property: property, description: description)
end

# Generate fake data for Property model
10.times do
  property_name = Faker::Address.community
  property_type = ["Apartment", "House", "Condo"].sample
  description = Faker::Lorem.paragraph(sentence_count: 2)
  floors = rand(1..10)
  facility_quality = ["Low", "Medium", "High"].sample
  bathrooms = rand(1..4)
  garage = [true, false].sample
  parking_spaces = rand(0..3)
  Property.create(
    property_name: property_name,
    property_type: property_type,
    description: description,
    floors: floors,
    facility_quality: facility_quality,
    bathrooms: bathrooms,
    garage: garage,
    parking_spaces: parking_spaces,
  )
end

# Generate fake data for Valuation model
10.times do
  property = Property.order("RANDOM()").first
  valuation_type = ["Market Value", "Assessed Value", "Appraised Value"].sample
  value = rand(100000..1000000) / 100.0
  valuation_date = Faker::Date.backward(days: 365)
  Valuation.create(property: property, valuation_type: valuation_type, value: value, valuation_date: valuation_date)
end
