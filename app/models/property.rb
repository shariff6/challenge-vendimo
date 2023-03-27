class Property < ApplicationRecord
  has_one :furnishing
  has_one :valuation
end
