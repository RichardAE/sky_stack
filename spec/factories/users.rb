FactoryGirl.define do
  factory :user do
    user_name { Faker::Name.name      }
    email     { Faker::Internet.email }
    password  '12345'
  end
end
