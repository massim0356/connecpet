class FriendsController < ApplicationController
  before_action :set_user, only: [:request_friendship, :accept_request, :decline_request, :cancel_request]
  def index
    skip_policy_scope
    @users =
      if params[:query].blank?
        current_user.friends
      else
        current_user.friends.search_by_first_name_last_name(params[:query])
      end
  end

  def show
    @friend = User.find(params[:id])
    @messages = current_user.messages_with(@friend).order(:created_at)
    @message = Message.new
    authorize [:friends, @friend]
  end

  def request_friendship
    set_user
    current_user.friend_request(@user)
    authorize @user
    redirect_to user_path(@user)
  end

  def accept_request
    set_user
    current_user.accept_request(@user)
    authorize @user
    redirect_to friends_path
  end

  def decline_request
    set_user
    current_user.decline_request(@user)
    authorize @user
    redirect_to friends_path
  end

  def cancel_request
    current_user.decline_request(@user)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:friend_id])
  end
end
