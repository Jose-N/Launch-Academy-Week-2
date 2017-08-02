require 'spec_helper'

feature 'user can get to articles/new', %() do

  scenario 'user should see the proper page' do
    visit('/articles/new')
    expect(page).to have_content('SUBMIT A NEW ARTICLE')
    expect(page).to have_content('Article Title')
    expect(page).to have_content('Article URL')
    expect(page).to have_content('Description')
  end
end
