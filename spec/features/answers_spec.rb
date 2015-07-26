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
    let(:question) { create(:question_with_answer) }

    scenario 'editing an answer' do
      visit question_path(question)
      click_on 'Edit Answer'

      fill_in  :answer_text, with: answer_text
      click_on 'Update Answer'

      expect(page).to have_content 'Your answer was modified successfully'
      expect(page).to have_content answer_text
    end
  end
end
