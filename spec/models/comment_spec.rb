require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { Comment.create(post_id: 1, author_id: 1, text: 'This is a comment') }

  it 'Post id should be present' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end
  it 'Author id should be present' do
    comment.author_id = nil
    expect(comment).to_not be_valid
  end
end
