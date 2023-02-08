require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I love cats',
      posts_counter: 0
    )
    @lilly = User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I love french fries',
      posts_counter: 2
    )
    visit root_path
  end

  it 'shows users usernames' do
    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@lilly.name)
  end

  it 'shows users photos' do
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo' and @alt='user profile']")
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo' and @alt='user profile']")
  end

  it 'shows the users posts' do
    expect(page).to have_content('Number of posts: 2')
  end

  it 'redirects to users show page' do
    click_on 'Tom'
    expect(page).to have_current_path user_path(@tom)
    expect(page).to have_content('I love cats')
  end
end
