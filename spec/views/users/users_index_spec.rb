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
    



end