require 'rails_helper'

RSpec.describe Agreement, type: :model do
  subject {
    described_class.new(name: "#1234", company_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a company" do
    subject.company_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

end
