require 'faker'

FactoryBot.define do
  factory :bank_account do
    organisation
    name { Faker::Bank.name}
    details  { { bik: Faker::Bank.swift_bic, 
                 account: Faker::Bank.account_number(digits: 13),
                 corr_account: Faker::Bank.routing_number } }
  end
end
