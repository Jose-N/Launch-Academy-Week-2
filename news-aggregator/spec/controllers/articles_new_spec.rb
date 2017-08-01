require 'spec_helper'

feature 'user can get to articles/new', %() do

  scenario 'user should see the proper page' do
    visit('/articles/new')
    expect(page).to have_content('SUBMIT A NEW ARTICLE')
  end
end
