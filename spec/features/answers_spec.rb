require 'rails_helper'

describe 'Answers', :js do

  let(:user)     { create(:user)     }
  let(:question) { create(:question) }

  scenario 'adding an answer' do
    login(user)
    visit question_path(question)

    answer_text = Faker::Lorem.paragraph

    fill_in  :answer_text, with: answer_text
    click_on 'Submit Answer'

    expect(page).to have_content 'Your answer was submitted successfully'
    expect(page).to have_content answer_text
  end

end
