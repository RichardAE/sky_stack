require 'rails_helper'

describe 'Comments', :js do

  let(:user) { create(:user) }

  before(:each) do
    login(user)
    visit question_path(question)
  end

  context 'question' do
    let(:question) { create(:question, user: user, comments_count: 1 ) }

    scenario 'add comment' do
      comment_text = Faker::Lorem.sentence

      fill_in  "question_#{question.id}_comments_text", with: comment_text
      within "#question_#{question.id}_comments_form" do
        click_on 'Add Comment'
      end

      expect(page).to have_content comment_text
      expect(find_field("question_#{question.id}_comments_text").value).to eq ''
    end

    scenario 'delete comment' do
      comment_text = question.comments.first.text

      within "#comment_#{question.comments.first.id}" do
        click_on "Delete"
      end

      expect(page).to_not have_content comment_text
    end
  end

  context 'answer' do
    let(:question) { create(:question, user: user, answers_count: 1, answers_comments_count: 1) }
    let(:answer)   { question.answers.first        }

    scenario 'add comment' do
      comment_text = Faker::Lorem.sentence

      fill_in  "answer_#{answer.id}_comments_text", with: comment_text
      within "#answer_#{answer.id}_comments_form" do
        click_on 'Add Comment'
      end

      expect(page).to have_content comment_text
      expect(find_field("answer_#{answer.id}_comments_text").value).to eq ''
    end

    scenario 'delete comment' do
      comment_text = answer.comments.first.text

      within "#comment_#{answer.comments.first.id}" do
        click_on "Delete"
      end

      expect(page).to_not have_content comment_text
    end
  end
end
