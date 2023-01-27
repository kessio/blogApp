# rubocop:disable all
class Post < ApplicationRecord
    has_many :comments, foreign_key: :post_id
end
