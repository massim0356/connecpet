class FriendsController < ApplicationController
  def index
    skip_policy_scope
    @users = current_user.friends
  end

  def show
    # direct messages page with friend
  end
end
