require 'rails_helper'

describe 'Questions', :js do

  let(:user) { create(:user) }

  scenario 'adding a question' do
    visit root_path
    login(user)

    fill_in :question_title, with: Faker::Lorem.sentence
    fill_in :question_text, with: Faker::Lorem.paragraph
    click_on 'Submit Question'

    expect(page).to have_content 'Your question was submitted successfully'
  end

end
