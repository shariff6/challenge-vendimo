# frozen_string_literal: true

module Types
  class ValuationType < Types::BaseObject
    field :id, ID, null: false
    field :property_id, Integer, null: false
    field :valuation_type, String
    field :value, Float
    field :valuation_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :property, Types::PropertyType, null: false # new field for property association

    def property
      if object.property.present?
        object.property
      else
        raise GraphQL::ExecutionError, "Property not found for this valuation"
      end
    end
  end
end
