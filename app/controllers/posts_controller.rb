class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def change_expired
    respond_to do |format|
      format.js { }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.expired = Time.now + params[:post][:expired].to_i*24*60*60
    @post.user_id = current_user.id
    @post.save
    respond_to do |format|
      format.js { }
    end

  def destroy
    binding.pry
    @post = Post.find(params[:id])
    #  first check the epiration date for security
    @post.destroy
    respond_to do |format|
      format.js { }
    end
   end
  end

  private
    def post_params
      params.require(:post).permit(:post_content)
    end
end
