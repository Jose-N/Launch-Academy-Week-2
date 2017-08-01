require 'spec_helper'

feature 'user can get to index', %(
When I visit /articles/new it has a form to submit a new article.
The form accepts an article title, URL, and description.
) do

  scenario 'user should see the proper page' do
    visit('/')
    expect(page).to have_content('Welcome to the Launch News Aggregator!')

    expect(page).to have_content('Article Name')
    expect(page).to have_content('Article URL')
    expect(page).to have_content('Description')
    expect(page).to have_content('Submit')
  end
end
