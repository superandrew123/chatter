class PostsController < ApplicationController

  def filter
    if current_user
      redirect_to following_index_path
    else
      redirect_to posts_path
    end
  end

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
    if params[:post][:expired] != nil
      if params[:post][:expired] == "very_soon"
        @post.expired = Time.now + 10     
      else
        @post.expired = Time.now + params[:post][:expired].to_i*24*60*60
      end
    end
    @post.user_id = current_user.id
    @post.save
    respond_to do |format|
      format.js { }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.expired < Time.now
      @post_id = @post.id
      @post.destroy
      respond_to do |format|
        format.js { }
      end
    end
  end

  def followers_index
    @user = current_user
    @followers = @user.followers.collect {|follow| User.find(follow.follower_id)}
    @posts = @followers.collect {|follower| follower.posts}
    @posts.flatten!
    @post = Post.new
    render "index"
  end

  def following_index
    @user = current_user
    @followings = @user.followings.collect {|follow| User.find(follow.followed_id)}
    @posts = @followings.collect {|follower| follower.posts}
    @posts.flatten!
    @post = Post.new
    render "index"
  end

  private
    def post_params
      params.require(:post).permit(:post_content)
    end
end
