require 'spec_helper'

feature 'user can get to articles', %(
As a slacker
I want to be able to visit a page that shows me all the submitted articles
So that I can slack off

When I visit /articles I should be able to see all the articles that have been submitted.
Each article should show the description, title, and URL.
) do

  scenario 'user should see the proper page' do
    visit('/articles')
    expect(page).to have_content('LIST OF ARTICLES')
  end
end
