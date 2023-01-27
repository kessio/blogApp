# rubocop:disable all
class Post < ApplicationRecord
    has_many :comments, class_name: 'Comment', foreign_key: :post_id
    has_many :likes, class_name: 'Like', foreign_key: :post_id

    belongs_to :author, class_name: 'User', foreign_key: :author_id 
end
