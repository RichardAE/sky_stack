require 'rails_helper'

describe 'Questions', :js do

  let(:user)           { create(:user) }
  let(:question_title) { Faker::Lorem.sentence  }
  let(:question_text)  { Faker::Lorem.paragraph }

  context 'new question' do
    before(:each) do
      login(user)
    end

    scenario 'add question' do
      fill_in :question_title, with: question_title
      fill_in :question_text, with: question_text
      click_on 'Create Question'

      expect(page).to have_content 'Your question was submitted successfully'
      expect(page).to have_content question_title
      expect(page).to have_content question_text
    end

    scenario 'add blank question' do
      click_on 'Create Question'

      expect(page).to have_content 'There was a problem with your question'
      expect(page).to have_content 'Title is too short'
      expect(page).to have_content 'Text is too short'
    end
  end

  context 'existing question' do
    let(:question) { create(:question, user: user) }

    context 'as owner' do
      before(:each) do
        login(user)
        visit question_path(question)
      end

      scenario 'edit question' do
        click_on 'Edit Question'

        fill_in  :question_title, with: question_title
        fill_in :question_text, with: question_text
        click_on 'Update Question'

        expect(page).to have_content 'Your question was modified successfully'
        expect(page).to have_content question_title
        expect(page).to have_content question_text
      end

      scenario 'delete question' do
        within "#question_#{question.id}" do
          click_on 'Delete'
        end

        expect(page).to     have_content 'Your question was deleted successfully'
        expect(page).to_not have_content question.title
      end
    end

    context 'as viewer' do
      let(:viewer) { create(:user) }

      before(:each) do
        login(viewer)
        visit question_path(question)
      end

      scenario 'view the question' do
        expect(page).to_not have_content('Edit Question')
        expect(page).to_not have_content('Delete')
      end
    end
  end
end
