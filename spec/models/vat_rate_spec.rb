require 'rails_helper'

RSpec.describe VatRate, type: :model do
  it "is invalid without a name" do
    expect(FactoryBot.build(:vat_rate, name: nil)).not_to be_valid
  end

  it "is invalid without a rate" do
    expect(FactoryBot.build(:vat_rate, rate: nil)).not_to be_valid
  end

end
