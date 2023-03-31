FactoryBot.define do
  factory :valuation do
    property
    valuation_type { "Market" }
    value { 100000.0 }
    valuation_date { Date.today }
  end
end
