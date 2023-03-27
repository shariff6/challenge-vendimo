# frozen_string_literal: true

module Types
  class FurnishingType < Types::BaseObject
    field :id, ID, null: false
    field :property_id, Integer, null: false
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
