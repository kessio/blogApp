# rubocop:disable all
class User < ApplicationRecord
    has_many :posts, class_name: 'Post', foreign_key: :author_id
end
