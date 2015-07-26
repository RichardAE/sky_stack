require 'rails_helper'

describe 'Comments', :js do

  let(:user) { create(:user) }

  context 'on a question' do
    let(:question) { create(:question) }

    scenario 'add a comment' do
      login(user)
      visit question_path(question)

      comment_text = Faker::Lorem.sentence

      fill_in  "question_#{question.id}_comments_text", with: comment_text
      click_on "question_#{question.id}_comments_submit"

      expect(page).to have_content comment_text
      expect(find_field("question_#{question.id}_comments_text").value).to eq ''
    end
  end

  context 'on an answer' do
    let(:question) { create(:question_with_answer) }

    scenario 'add a comment' do
      login(user)
      visit question_path(question)

      comment_text = Faker::Lorem.sentence

      fill_in  "answer_#{question.answers.first.id}_comments_text", with: comment_text
      click_on "answer_#{question.answers.first.id}_comments_submit"

      expect(page).to have_content comment_text
      expect(find_field("answer_#{question.answers.first.id}_comments_text").value).to eq ''
    end
  end

end
