FactoryGirl.define do
  factory :answer do
    text        { Faker::Lorem.sentence }
    association :question
    association :user

    transient do
      comments_count nil
    end

    after(:create) do |answer, factory|
      if factory.comments_count
        factory.comments_count.times do
          create(:answer_comment, commentable: answer, user: answer.user)
        end
      end
    end
  end
end
