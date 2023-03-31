module GraphqlHelper
  def execute_query(query, variables: {})
    ChallengeVendimoSchema.execute(query, variables: variables)
  end
end
