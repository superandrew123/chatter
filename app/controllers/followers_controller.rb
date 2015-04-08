class FollowersController < ApplicationController

  def new
    new_follows = Follower.find_or_create_by(followed_id: params[:format], follower_id: current_user.id)
    redirect_to user_path(User.find(params[:format]))
  end

  def create
    binding.pry
  end

  def destroy
    @follows = Follower.find(params[:id])
    @user = User.find(@follows.followed_id)
    @follows.destroy
    redirect_to user_path(@user)
  end

  def show
    binding.pry
  end

end
