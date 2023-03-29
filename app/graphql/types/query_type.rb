module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :properties, [Types::PropertyType], null: false do
      description "Returns a list of all properties"
    end

    def properties
      Property.all
    end

    field :property, Types::PropertyType, null: true do
      description "Returns a single property by ID"
      argument :id, ID, required: true
    end

    def property(id:)
      Property.find_by(id: id)
    end

    field :furnishings, [Types::FurnishingType], null: false do
      description "Returns a list of all Furnishings"
    end

    def furnishings
      Furnishing.all
    end

    field :furnishing, Types::FurnishingType, null: true do
      description "Find a furnishing by ID"
      argument :id, ID, required: true
    end

    def furnishing(id:)
      furnishing = Furnishing.find_by(id: id)
    end

    field :valuations, [Types::ValuationType], null: false do
      description "Returns a list of all valuations"
    end

    def valuations
      valuations = Valuation.all
    end

    field :valuation, Types::ValuationType, null: true do
      description "Returns a single valuation by ID"
      argument :id, ID, required: true
    end

    def valuation(id:)
      valuation = Valuation.find_by(id: id)
    end
  end
end
