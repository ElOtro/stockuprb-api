require 'faker'

FactoryBot.define do
  factory :organisation do
    name { Faker::Company.name }
    full_name  { Faker::Company.name }
    ceo { Faker::Name.name }
    ceo_title {'ceo' }
    cfo  { Faker::Name.name }
    cfo_title { 'cfo' }
  end
end
