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
    binding.pry
    @post = Post.new(post_params)
    if params[:expired] != nil
      @post.expired = Time.now + params[:post][:expired].to_i*24*60*60
    end
    @post.user_id = current_user.id
    @post.save
    respond_to do |format|
      format.js { }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post_id = @post.id
    @post.destroy
     respond_to do |format|
        format.js { }
      end
   end

  private
    def post_params
      params.require(:post).permit(:post_content)
    end
end
