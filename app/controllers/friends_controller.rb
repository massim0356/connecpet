class FriendsController < ApplicationController
  def index
    skip_policy_scope
    @users = current_user.friends
  end

  def show
    @user = current_user
    @friend = @user.friends[id: params[:friend_id]]
  end
end
