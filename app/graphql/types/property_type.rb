# frozen_string_literal: true

module Types
  class PropertyType < Types::BaseObject
    field :id, ID, null: false
    field :property_name, String
    field :property_type, String
    field :description, String
    field :floors, Integer
    field :facility_quality, String
    field :bathrooms, Integer
    field :garage, Boolean
    field :parking_spaces, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :furnishings, Types::FurnishingType, null: true
    field :valuations, Types::ValuationType, null: true

    def furnishings
      object.furnishing
    end

    def valuations
      object.valuation
    end
  end
end
