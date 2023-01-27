class RemovePostsFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :post, null: false, foreign_key: true
    add_reference :comments, :post, foreign_key: {to_table: :posts}
  end
end
