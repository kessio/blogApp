require 'rails_helper'

RSpec.describe Post, type: :system do
  before :each do
    @user = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      post_counter: 1
    )
    @post = Post.create(
      title: 'Hello',
      text: 'My first post',
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

  it 'shows the username of user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts of user' do
    expect(page.body).to have_content(@user.post_counter.to_s)
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
end
