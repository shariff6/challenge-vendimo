module Mutations
  class DeleteFurnishing < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      begin
        furnishing = Furnishing.find(id)
        furnishing.destroy!
        { success: true }
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("Furnishing with ID #{id} not found.")
      rescue ActiveRecord::RecordNotDestroyed => e
        GraphQL::ExecutionError.new("Failed to delete furnishing: #{e.message}")
      end
    end
  end
end
