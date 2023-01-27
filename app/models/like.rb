# rubocop:disable all
class Like < ApplicationRecord
    belongs_to :post, class_name: 'Post', foreign_key: :post_id
end
