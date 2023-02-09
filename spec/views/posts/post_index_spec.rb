require 'rails_helper'

RSpec.describe Post, type: :feature do
  before :each do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher',
      posts_counter: 1
    )
    @post = Post.create(
      title: 'Hello',
      text: 'My first post',
      likes_counter: 0,
      author_id: @user.id
    )
    5.times do
      Comment.create(
        post: @post,
        author: @user,
        text: 'Good job on the post',
        post_id: @post.id,
        author_id: @user.id
      )
    end
    visit user_posts_path(@user.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src ='https://unsplash.com/photos/F_-0BxGuVvo' and @alt='user profile']")
  end

  it 'shows the username of user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts of user' do
    expect(page.body).to have_content(@user.posts_counter.to_s)
  end

  it 'shows the post title' do
    expect(page).to have_content('Hello')
  end

  it 'shows the body of a post' do
    expect(page).to have_content('My first post')
  end

  it 'shows first comments on a post' do
    expect(page).to have_content('Good job on the post')
  end

  it 'shows number of comments for a post' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows number of likes for a post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to the post show page when the post title is clicked' do
    click_link('Hello')
    expect(page).to have_current_path(user_post_path(@user.id, @post.id))
  end
end
