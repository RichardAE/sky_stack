require 'rails_helper'

describe 'Answers', :js do

  let(:user)        { create(:user)          }
  let(:question)    { create(:question)      }
  let(:answer_text) { Faker::Lorem.paragraph }

  before(:each) do
    login(user)
    visit question_path(question)
  end

  scenario 'add answer' do
    fill_in  :answer_text, with: answer_text
    click_on 'Create Answer'

    expect(page).to have_content 'Your answer was submitted successfully'
    expect(page).to have_content answer_text
  end

  scenario 'add blank answer' do
    click_on 'Create Answer'

    expect(page).to have_content 'There was a problem with your answer'
    expect(page).to have_content 'Text is too short'
  end

  context 'existing answer' do
    let(:question) { create(:question, user: user, answers_count: 1) }
    let(:answer)   { question.answers.first                          }

    before(:each) do
      visit question_path(question)
    end

    scenario 'edit answer' do
      click_on 'Edit Answer'

      fill_in  :answer_text, with: answer_text
      click_on 'Update Answer'

      expect(page).to have_content 'Your answer was modified successfully'
      expect(page).to have_content answer_text
    end

    scenario 'delete answer' do
      within "#answer_#{answer.id}" do
        click_on 'Delete'
      end

      expect(page).to     have_content 'Your answer was deleted successfully'
      expect(page).to_not have_content answer.text
    end
  end
end
