require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { Post.create(title: 'Test post', comments_counter: 5, likes_counter: 20) }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments counter should be an integer' do
    subject.comments_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'Comments counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be an integer' do
    subject.likes_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
