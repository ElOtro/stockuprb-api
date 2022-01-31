require "rails_helper"

RSpec.describe V1::ContactsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/v1/companies/1/contacts").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: 'index',
        company_id: "1"
      )
    end

    it "routes to #show" do
      expect(get: "/v1/companies/1/contacts/1").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: "show",
        id: "1",
        company_id: "1"
      )
    end


    it "routes to #create" do
      expect(post: "/v1/companies/1/contacts").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: "create",
        company_id: "1"
      )
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/companies/1/contacts/1").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: "update",
        id: "1",
        company_id: "1"
      )
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/companies/1/contacts/1").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: "update",
        id: "1",
        company_id: "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "/v1/companies/1/contacts/1").to route_to(
        format: :json,
        controller: 'v1/contacts',
        action: "destroy",
        id: "1",
        company_id: "1"
      ) 
    end
  end
end
