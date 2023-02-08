require 'rails_helper'

RSpec.describe 'User Page Show', type: :feature do
    before :each do
        @user = User.create(
            name: 'Tom',
            photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'I love cats',
            posts_counter: 3,
            id: 2
        )
        @post1 = Post.create(
            text: 'This is my first post',
            comments_counter: 2,
            likes_counter: 3,
            author_id: @user.id
        )
        @post2 = Post.create(
            text: 'This is my second post',
            comments_counter: 2,
            likes_counter: 3,
            author_id: @user.id
        )
        @post3 = Post.create(
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

      it 'shows user first three posts' do
        expect(page).to have_content(@post1.text)
      end






end