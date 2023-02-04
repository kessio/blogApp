class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user, @comment.post)
        else
          redirect_to new_post_comment_path(current_user)
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(author: current_user, post_id: params.require(:post_id))
  end
end
