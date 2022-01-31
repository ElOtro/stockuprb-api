require "rails_helper"

RSpec.describe V1::VatRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/v1/vat_rates").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: 'index'
      )
    end

    it "routes to #show" do
      expect(get: "/v1/vat_rates/1").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: "show",
        id: "1"
      )
    end


    it "routes to #create" do
      expect(post: "/v1/vat_rates").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: "create",
      )
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/vat_rates/1").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: "update",
        id: "1"
      )
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/vat_rates/1").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: "update",
        id: "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "/v1/vat_rates/1").to route_to(
        format: :json,
        controller: 'v1/vat_rates',
        action: "destroy",
        id: "1"
      ) 
    end
  end
end
