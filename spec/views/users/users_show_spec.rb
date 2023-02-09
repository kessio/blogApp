require 'rails_helper'

RSpec.describe 'User Page Show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I love cats',
      posts_counter: 3
    )
    @post1 = Post.create(
      title: 'First Post',
      text: 'here we go again',
      comments_counter: 2,
      likes_counter: 3,
      author_id: @user.id
    )
    @post2 = Post.create(
      title: 'Second Post',
      text: 'This is my second post',
      comments_counter: 2,
      likes_counter: 3,
      author_id: @user.id
    )
    @post3 = Post.create(
      title: 'Third Post',
      text: 'This is my third post',
      comments_counter: 2,
      likes_counter: 3,
      author_id: @user.id
    )
    visit user_path(@user.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src ='https://unsplash.com/photos/F_-0BxGuVvo'
         and @alt='user profile']")
  end

  it 'shows the username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows  number of posts' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'shows first three posts of user' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'redirects to post show page upon click' do
    click_link(@post1.title)
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  it 'shows button for seeing all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to post show page upon click' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
