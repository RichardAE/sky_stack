require 'rails_helper'

describe 'Answers', :js do

  let(:user)        { create(:user)          }
  let(:question)    { create(:question)      }
  let(:answer_text) { Faker::Lorem.paragraph }

  before(:each) do
    login(user)
  end

  scenario 'adding an answer' do
    visit question_path(question)

    fill_in  :answer_text, with: answer_text
    click_on 'Create Answer'

    expect(page).to have_content 'Your answer was submitted successfully'
    expect(page).to have_content answer_text
  end

  context 'existing answer' do
    let(:question) { create(:question, answers_count: 1) }
    let(:answer)   { question.answers.first              }

    before(:each) do
      visit question_path(question)
    end

    scenario 'editing an answer' do
      click_on 'Edit Answer'

      fill_in  :answer_text, with: answer_text
      click_on 'Update Answer'

      expect(page).to have_content 'Your answer was modified successfully'
      expect(page).to have_content answer_text
    end

    scenario 'deleting an answer' do
      within "#answer_#{answer.id}" do
        click_on "Delete"
      end

      expect(page).to     have_content 'Your answer was deleted successfully'
      expect(page).to_not have_content answer.text
    end
  end
end
