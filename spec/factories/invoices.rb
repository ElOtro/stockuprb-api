require 'faker'

FactoryBot.define do
  factory :invoice do
    is_active { true }
    date { DateTime.now() }
    number { "121" }
    organisation
    bank_account
    company
    agreement
  end
end
