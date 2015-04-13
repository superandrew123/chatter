class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    respond_to do |format|
      format.js { }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.save
    # @comment.post.comments.last
    # binding.pry
    respond_to do |format|
      format.js { }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end



