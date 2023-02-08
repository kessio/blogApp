require 'rails_helper'

RSpec.describe 'User Page Show', type: :feature do
    before :each do
        @tom = User.create(
            name: 'Tom',
            photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'I love cats',
            posts_counter: 2
        )
        @post1 = Post.create(
            text: 'This is my first post',
            comments_counter: 2,
            likes_counter: 3,
            author_id: @tom.id
        )
        @post2 = Post.create(
            text: 'This is my first post',
            comments_counter: 2,
            likes_counter: 3,
            author_id: @tom.id
        )
        visit user_path(@tom.id)
    end

    it 'shows the profile picture of the user' do
        assert page.has_xpath?("//img[@src ='https://unsplash.com/photos/F_-0BxGuVvo'
         and @alt='user profile']")
      end

      it 'shows the username' do
        expect(page).to have_content(@tom.name)
      end

      it 'shows  number of posts' do
        expect(page).to have_content(@tom.posts_counter)
      end






end