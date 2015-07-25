require 'rails_helper'

feature 'Homepage', :js do
  scenario 'visiting the homepage' do
    visit root_path

    expect(page).to have_content 'Sky Stack'
  end
end
