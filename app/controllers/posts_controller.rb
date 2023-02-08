class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts.includes(:comments)
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(current_user, @post)
        else
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author: current_user, comments_counter: 0, likes_counter: 0)
  end
end
