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

  def request_friendship
    @user = User.find(params[:friend_id])
    current_user.friend_request(@user)
    authorize @user
    redirect_to user_path(@user)
  end

  def accept_request
    #find user by params
    # current user should accept request of the user
    # need to authorize with pundit
    #need to add this in pundit policy
    # redirect to friends index
    @user = User.find(params[:friend_id])
    current_user.accept_request(@user)
    authorize @user
    redirect_to friends_path
    # if it's a nested id, it takes the name of the thing before it
  end

  def decline_request
    # find user by params
    # current user declines request
    # need to authorize with pundit
    # add in user policy
    # redirect to friends index - maybe with notification?
    @user = User.find(params[:friend_id])
    current_user.decline_request(@user)
    authorize @user
    redirect_to friends_path
  end
end
