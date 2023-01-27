require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', posts_counter: 6) }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Posts counter should be a number' do
    subject.posts_counter = 'six'
    expect(subject).to_not be_valid
  end
  it 'Posts counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
