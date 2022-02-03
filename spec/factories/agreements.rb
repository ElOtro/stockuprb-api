require 'faker'

FactoryBot.define do
  factory :agreement do
    name { "#1234" }
    company { create :company }
    start_at { DateTime.now - 6.months }
    end_at { DateTime.now }
    name { Faker::Invoice.creditor_reference }
  end
end
