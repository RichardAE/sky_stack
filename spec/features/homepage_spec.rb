require 'rails_helper'

describe 'Homepage', :js do
  scenario 'visiting the homepage' do
    visit root_path

    expect(page).to have_content 'Login'
  end
end
