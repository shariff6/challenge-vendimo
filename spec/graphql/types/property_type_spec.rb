require "rails_helper"
require "graphql_helper"

RSpec.describe Types::QueryType do
  # Query to get all properties
  let(:all_properties_query) do
    <<~GQL
      query {
        properties {
          id
          propertyName
          propertyType
          description
          floors
          facilityQuality
          bathrooms
          garage
          parkingSpaces
        }
      }
    GQL
  end

  # Query to get a single property
  let(:single_property_query) do
    <<~GQL
      query Property($id: ID!) {
        property(id: $id) {
          id
          propertyName
          propertyType
          description
          floors
          facilityQuality
          bathrooms
          garage
          parkingSpaces
        }
      }
    GQL
  end

  # Test to get all properties
  it "returns all properties" do
    FactoryBot.create_list(:property, 10)
    result = execute_query(all_properties_query)
    expect(result["errors"]).to be_nil
    expect(result["data"]["properties"].size).to eq(10)
  end

  describe "returns a single property" do
    let!(:property) { FactoryBot.create(:property) }
    let(:query) do
      %(query {
        property(id: #{property.id}) {
          id
          propertyName
          propertyType
          description
          floors
          facilityQuality
          bathrooms
          garage
          parkingSpaces
        }
      })
    end

    it "returns the correct property" do
      result = ChallengeVendimoSchema.execute(query)
      expect(result["errors"]).to be_nil
      expect(result["data"]["property"]["id"]).to eq(property.id.to_s)
    end
  end
end
