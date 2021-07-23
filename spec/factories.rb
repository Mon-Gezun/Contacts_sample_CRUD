FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end

