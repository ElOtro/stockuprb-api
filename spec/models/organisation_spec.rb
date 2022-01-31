require 'rails_helper'

RSpec.describe Organisation, type: :model do
  it "is valid with valid attributes" do
    organisation = Organisation.new(name: "Tech", full_name: "Tech corp", ceo: "Alan Li", cfo: "Cris Mac")
    expect(organisation).to be_valid
  end

  it "is not valid without a name" do
    organisation = Organisation.new(full_name: "Tech corp", ceo: "Alan Li", cfo: "Cris Mac")
    expect(organisation).to_not be_valid
  end

  it "is not valid without a full_name" do
    organisation = Organisation.new(name: "Tech", ceo: "Alan Li", cfo: "Cris Mac")
    expect(organisation).to_not be_valid
  end

  it "is not valid without a ceo" do
    organisation = Organisation.new(name: "Tech", full_name: "Tech corp", cfo: "Cris Mac")
    expect(organisation).to_not be_valid
  end

  it "is not valid without a cfo" do
    organisation = Organisation.new(name: "Tech", full_name: "Tech corp", ceo: "Alan Li")
    expect(organisation).to_not be_valid
  end

end
