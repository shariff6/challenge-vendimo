require "rails_helper"
require "graphql_helper"

RSpec.describe Types::QueryType do
  # Query to get all valuations
  let(:all_valuations_query) do
    <<~GQL
      query {
        valuations {
          id
          property {
            id
            propertyName
          }
          value
          valuationDate
        }
      }
    GQL
  end

  # Query to get a single valuation
  let(:single_valuation_query) do
    <<~GQL
      query Valuation($id: ID!) {
        valuation(id: $id) {
          id
          property {
            id
            propertyName
          }
          value
          valuationDate
        }
      }
    GQL
  end

  # Test to get all valuations
  it "returns all valuations" do
    FactoryBot.create_list(:valuation, 10)
    result = execute_query(all_valuations_query)
    expect(result["errors"]).to be_nil
    expect(result["data"]["valuations"].size).to eq(10)
  end

  describe "returns a single valuation" do
    let!(:valuation) { FactoryBot.create(:valuation) }
    let(:query) do
      %(query {
        valuation(id: #{valuation.id}) {
          id
          property {
            id
            propertyName
          }
          value
          valuationDate
        }
      })
    end

    it "returns the correct valuation" do
      result = ChallengeVendimoSchema.execute(query)
      expect(result["errors"]).to be_nil
      expect(result["data"]["valuation"]["id"]).to eq(valuation.id.to_s)
    end
  end
end
