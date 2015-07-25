FactoryGirl.define do
  factory :question do
    title       { Faker::Lorem.sentence  }
    text        { Faker::Lorem.paragraph }
    association :user
  end
end
