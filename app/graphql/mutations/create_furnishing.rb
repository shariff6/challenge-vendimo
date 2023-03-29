module Mutations
  class CreateFurnishing < BaseMutation
    argument :property_id, ID, required: true
    argument :description, String, required: true

    field :furnishing, Types::FurnishingType, null: true
    field :errors, [String], null: false

    def resolve(property_id:, description:)
      property = Property.find_by(id: property_id)
      if property
        furnishing = property.build_furnishing(description: description)
        if furnishing.save
          {
            furnishing: furnishing,
            errors: [],
          }
        else
          {
            furnishing: nil,
            errors: furnishing.errors.full_messages,
          }
        end
      else
        {
          furnishing: nil,
          errors: ["Property not found"],
        }
      end
    end
  end
end
