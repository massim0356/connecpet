class FriendsController < ApplicationController
  def show
    @user = current_user
    @friend = @user.friends[id: params[:friend_id]]
  end
end
