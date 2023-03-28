module Mutations
  class DeleteProperty < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      begin
        property = Property.find(id)
        property.destroy!
        { success: true }
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("Property with ID #{id} not found.")
      rescue ActiveRecord::RecordNotDestroyed => e
        GraphQL::ExecutionError.new("Failed to delete property: #{e.message}")
      end
    end
  end
end
