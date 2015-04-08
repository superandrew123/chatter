class UsersController < ApplicationController

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
    # binding.pry

    @followings_count = @user.followings.count
    @followers_count = @user.followers.count

  end

end
