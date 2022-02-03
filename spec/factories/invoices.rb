require 'faker'

FactoryBot.define do
  factory :invoice do
    is_active { true }
    date { DateTime.now() }
    number { "121" }
    organisation { create :organisation }
    bank_account { create :bank_account, organisation_id: organisation.id }
    company { create :company }
    agreement { create :agreement, company_id: company.id }
  end
end
