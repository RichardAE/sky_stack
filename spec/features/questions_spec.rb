require 'rails_helper'

describe 'Questions', :js do

  let(:user)           { create(:user) }
  let(:question_title) { Faker::Lorem.sentence }

  before(:each) do
    login(user)
  end

  scenario 'adding a question' do
    fill_in :question_title, with: question_title
    fill_in :question_text, with: Faker::Lorem.paragraph
    click_on 'Create Question'

    expect(page).to have_content 'Your question was submitted successfully'
    expect(page).to have_content question_title
  end

  context 'existing question' do
    let(:question) { create(:question) }

    scenario 'editing a question' do
      visit question_path(question)
      click_on 'Edit Question'

      fill_in  :question_title, with: question_title
      click_on 'Update Question'

      expect(page).to have_content 'Your question was modified successfully'
      expect(page).to have_content question_title
    end
  end
end
