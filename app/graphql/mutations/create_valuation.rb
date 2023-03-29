module Mutations
  class CreateValuation < BaseMutation
    argument :property_id, Integer, required: true
    argument :valuation_type, String, required: true
    argument :value, Float, required: true
    argument :valuation_date, GraphQL::Types::ISO8601Date, required: true

    field :valuation, Types::ValuationType, null: true
    field :errors, [String], null: false

    def resolve(property_id:, valuation_type:, value:, valuation_date:)
      valuation = Valuation.new(property_id: property_id, valuation_type: valuation_type, value: value, valuation_date: valuation_date)

      if valuation.save
        { valuation: valuation }
      else
        { errors: valuation.errors.full_messages }
      end
    end
  end
end
