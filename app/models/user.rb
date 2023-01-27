class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: :author_id
  has_many :comments, class_name: 'Comment', foreign_key: :author_id
  has_many :likes, class_name: 'Like', foreign_key: :author_id

  validate :name, presence: true
  validate :posts_counter, numericality: { only integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    Post.order(created_at: :desc).includes(:author).limit(3)
  end
end
