FactoryBot.define do
  factory :property do
    property_name { Faker::Lorem.words(number: 3).join(" ") }
    property_type { %w[house apartment condo townhouse].sample }
    description { Faker::Lorem.sentence }
    floors { Faker::Number.between(from: 1, to: 10) }
    facility_quality { %w[low medium high].sample }
    bathrooms { Faker::Number.between(from: 1, to: 5) }
    garage { [true, false].sample }
    parking_spaces { Faker::Number.between(from: 0, to: 3) }
  end
end
