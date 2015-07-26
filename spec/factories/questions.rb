FactoryGirl.define do
  factory :question do
    title       { Faker::Lorem.sentence  }
    text        { Faker::Lorem.paragraph }
    association :user

    factory :question_with_answer do
      after(:create) do |question|
        create(:answer, question: question)
      end
    end
  end
end
