module Mutations
  class CreateProperty < BaseMutation
    # define the arguments that will be passed to the mutation
    argument :property_name, String, required: true
    argument :property_type, String, required: true
    argument :description, String, required: false
    argument :floors, Integer, required: false
    argument :facility_quality, String, required: false
    argument :bathrooms, Integer, required: false
    argument :garage, Boolean, required: false
    argument :parking_spaces, Integer, required: false
    argument :furnishings, [String], required: false

    # define the return type of the mutation
    type Types::PropertyType

    def resolve(property_name:, property_type:, **args)
      # create a new Property with the given arguments
      property = Property.create!(
        property_name: property_name,
        property_type: property_type,
        **args,
      )

      # return the created property
      property
    end
  end
end
