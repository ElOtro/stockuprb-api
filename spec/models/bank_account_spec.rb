require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  subject {
    described_class.new(attributes_for(:bank_account))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
