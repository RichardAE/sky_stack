FactoryGirl.define do
  factory :question_comment do
    text        { Faker::Lorem.sentence }
    association :commentable, factory: :question
    association :user
  end

  factory :answer_comment do
    text        { Faker::Lorem.sentence }
    association :commentable, factory: :answer
    association :user
  end
end
