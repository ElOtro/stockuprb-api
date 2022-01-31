FactoryBot.define do
  factory :user do
    is_active { true }
    name { Faker::Name.name }
  end
end
