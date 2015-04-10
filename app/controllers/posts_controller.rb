class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    # binding.pry
    respond_to do |format|
      format.js { }
    end
  end

  private
    def post_params
      params.require(:post).permit(:post_content)
    end
end
