require 'spec_helper'

feature 'user can submit a new article', %(
As a slacker
I want to be able to submit an incredibly interesting article
So that other slackers may benefit

The form accepts an article title, URL, and description.
When I successfully post an article, it should be saved to a CSV file
) do

  scenario 'user submits a valid article' do
    visit('/articles/new')

    fill_in 'article_name', with: 'App sizes are out of control'
    fill_in 'article_url', with: 'https://trevore.com/blog/posts/app-sizes-are-out-of-control/'
    fill_in 'article_description', with: 'Complaints how the drive space articles are taking up is out of control'
    click_button('Submit')

    visit('/articles')
    expect(page).to have_content('https://trevore.com/blog/posts/app-sizes-are-out-of-control/')
  end

  scenario 'user submits an invalid article' do
    visit('/articles/new')

    fill_in 'article_description', with: 'Complaints how the drive space articles are taking up is out of control'
    click_button('Submit')

    expect(page).to have_content('Error you need to submit a title')
    expect(page).to have_content('Error you need to submit a URL')
    expect(page).to have_content('Complaints how the drive space articles are taking up is out of control')


  end
end
