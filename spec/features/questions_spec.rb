require 'rails_helper'

describe 'Questions', :js do

  let(:user)           { create(:user) }
  let(:question_title) { Faker::Lorem.sentence  }
  let(:question_text)  { Faker::Lorem.paragraph }

  before(:each) do
    login(user)
  end

  scenario 'adding a question' do
    fill_in :question_title, with: question_title
    fill_in :question_text, with: question_text
    click_on 'Create Question'

    expect(page).to have_content 'Your question was submitted successfully'
    expect(page).to have_content question_title
    expect(page).to have_content question_text
  end

  context 'existing question' do
    let(:question) { create(:question) }

    scenario 'editing a question' do
      visit question_path(question)
      click_on 'Edit Question'

      fill_in  :question_title, with: question_title
      fill_in :question_text, with: question_text
      click_on 'Update Question'

      expect(page).to have_content 'Your question was modified successfully'
      expect(page).to have_content question_title
      expect(page).to have_content question_text
    end
  end
end
