require 'faker'

FactoryBot.define do
  name = Faker::Company.name
  full_name = "#{name} #{Faker::Company.suffix}"
  factory :company do
    name { name }
    full_name { full_name }
    details do
      { inn: Faker::Company.russian_tax_number,
        kpp: Faker::Company.russian_tax_number,
        corr_account: Faker::Bank.routing_number,
        ogrn: '123456789', Address: Faker::Address.full_address }
    end
  end
end
