class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])

    Like.create(author: current_user, post:)

    redirect_to user_post_path(post.author, post)
  end
end
