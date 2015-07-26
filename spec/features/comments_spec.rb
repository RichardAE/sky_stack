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
      within "#question_#{question.id}_comments_form" do
        click_on 'Create Comment'
      end

      expect(page).to have_content comment_text
      expect(find_field("question_#{question.id}_comments_text").value).to eq ''
    end
  end

  context 'on an answer' do
    let(:question) { create(:question_with_answer) }
    let(:answer)   { question.answers.first        }

    scenario 'add a comment' do
      login(user)
      visit question_path(question)

      comment_text = Faker::Lorem.sentence

      fill_in  "answer_#{answer.id}_comments_text", with: comment_text
      within "#answer_#{answer.id}_comments_form" do
        click_on 'Create Comment'
      end

      expect(page).to have_content comment_text
      expect(find_field("answer_#{answer.id}_comments_text").value).to eq ''
    end
  end

end
