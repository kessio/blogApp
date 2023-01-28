require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { Like.create(author_id: 2) }

  it 'User id should be present' do
    like.author_id = nil
    expect(like).to_not be_valid
  end
end
