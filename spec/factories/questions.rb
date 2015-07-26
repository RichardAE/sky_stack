FactoryGirl.define do
  factory :question do
    title       { Faker::Lorem.sentence  }
    text        { Faker::Lorem.paragraph }
    association :user

    transient do
      comments_count         nil
      answers_count          nil
      answers_comments_count nil
    end

    after(:create) do |question, factory|
      if factory.comments_count
        factory.comments_count.times do
          create(:question_comment, commentable: question, user: question.user)
        end
      end

      if factory.answers_count
        factory.answers_count.times do
          if factory.answers_comments_count
            create(:answer, question: question, user: question.user, comments_count: factory.answers_comments_count)
          else
            create(:answer, question: question, user: question.user)
          end
        end
      end
    end
  end
end
