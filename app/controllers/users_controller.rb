class UsersController < ApplicationController
  def index
    @users = policy_scope(@user)
  end

  def show
    @user = User.find(params[:id])
  end
end
