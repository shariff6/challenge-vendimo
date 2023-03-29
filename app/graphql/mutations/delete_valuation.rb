module Mutations
  class DeleteValuation < BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true
    field :errors, [String], null: false

    def resolve(id:)
      valuation = Valuation.find_by(id: id)

      unless valuation
        return { errors: ["Valuation not found"] }
      end

      if valuation.destroy
        { id: id }
      else
        { errors: valuation.errors.full_messages }
      end
    end
  end
end
