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

  scenario 'adding a blank question' do
    click_on 'Create Question'

    expect(page).to have_content 'There was a problem with your question'
    expect(page).to have_content 'Title is too short'
    expect(page).to have_content 'Text is too short'
  end

  context 'existing question' do
    let(:question) { create(:question) }

    before(:each) do
      visit question_path(question)
    end

    scenario 'editing a question' do
      click_on 'Edit Question'

      fill_in  :question_title, with: question_title
      fill_in :question_text, with: question_text
      click_on 'Update Question'

      expect(page).to have_content 'Your question was modified successfully'
      expect(page).to have_content question_title
      expect(page).to have_content question_text
    end

    scenario 'deleting a question' do
      within "#question_#{question.id}" do
        click_on "Delete"
      end

      expect(page).to     have_content 'Your question was deleted successfully'
      expect(page).to_not have_content question.title
    end
  end
end
