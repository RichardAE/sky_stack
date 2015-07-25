FactoryGirl.define do
  factory :answer do
    text        { Faker::Lorem.sentence }
    association :question
    association :user
  end
end
