class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    # check to see if current_user is already following @user
    @following_status = false
    if current_user
      if Follower.find_by(follower_id: current_user.id, followed_id: @user.id)
        @follower = Follower.find_by(follower_id: current_user.id, followed_id: @user.id)
        @following_status = true
      end
    end
    @followings = @user.followings.collect do |follower|
      User.find(follower.followed_id)
    end.uniq
    @followers = @user.followers.collect do |follower|
      User.find(follower.follower_id)
    end.uniq
  end

  def search
    @q = params[:query]
    @results = Search.search(@q)
    render :"/users/index"
  end
end
