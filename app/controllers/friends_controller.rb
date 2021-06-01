class FriendsController < ApplicationController
  def index
    skip_policy_scope
    @users = current_user.friends
  end

  def show
    @friend = User.find(params[:id])
    @messages = current_user.messages_with(@friend)
    @message = Message.new
    authorize @friend
  end
end
