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
    visit user_post_path(@user.id, @post.id)
  end

  it 'shows post title' do
    expect(page).to have_content('Hello')
  end

  it 'shows post author' do
    expect(page).to have_content('Tom')
  end

  it 'shows how many comments a post has' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows how many likes a post has' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows the post body' do
    expect(page).to have_content('My first post')
  end

  it 'shows comment author' do
    expect(page).to have_content('Tom')
  end

  it 'shows comment body' do
    expect(page).to have_content('Good job on the post')
  end
end
