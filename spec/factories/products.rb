require 'faker'

FactoryBot.define do
  name = Faker::Commerce.product_name
  factory :product do
    is_active { true }
    product_type { 1 }
    name { name }
    sku { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 3)}" }
    description { "#{name} (#{Faker::Commerce.brand})" }
    price { Faker::Commerce.price }
    vat_rate
    unit
  end
end
