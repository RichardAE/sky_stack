require 'rails_helper'

describe 'Questions', :js do

  let(:user) { create(:user) }

  scenario 'adding a question' do
    login(user)

    question_title = Faker::Lorem.sentence

    fill_in :question_title, with: question_title
    fill_in :question_text, with: Faker::Lorem.paragraph
    click_on 'Submit Question'

    expect(page).to have_content 'Your question was submitted successfully'
    expect(page).to have_content question_title
  end

end
