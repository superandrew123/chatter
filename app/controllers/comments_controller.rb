class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    #binding.pry
  end

  def create
    #@post = Post.find_by(:id => params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id=params[:post_id]
    @comment.user_id=current_user.id
    @comment.save
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end



