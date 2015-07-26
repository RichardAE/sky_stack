FactoryGirl.define do
  factory :question_comment, class: Comment do
    text        { Faker::Lorem.sentence }
    association :commentable, factory: :question
    association :user
  end

  factory :answer_comment, class: Comment do
    text        { Faker::Lorem.sentence }
    association :commentable, factory: :answer
    association :user
  end
end
