require "rails_helper"

RSpec.describe V1::BankAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/v1/organisations/1/bank_accounts").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: 'index',
        organisation_id: "1"
      )
    end

    it "routes to #show" do
      expect(get: "/v1/organisations/1/bank_accounts/1").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: "show",
        id: "1",
        organisation_id: "1"
      )
    end


    it "routes to #create" do
      expect(post: "/v1/organisations/1/bank_accounts").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: "create",
        organisation_id: "1"
      )
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/organisations/1/bank_accounts/1").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: "update",
        id: "1",
        organisation_id: "1"
      )
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/organisations/1/bank_accounts/1").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: "update",
        id: "1",
        organisation_id: "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "/v1/organisations/1/bank_accounts/1").to route_to(
        format: :json,
        controller: 'v1/bank_accounts',
        action: "destroy",
        id: "1",
        organisation_id: "1"
      ) 
    end
  end
end
