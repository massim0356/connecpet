class UsersController < ApplicationController
  def index
    @users = policy_scope(User).near([current_user.latitude, current_user.longitude], 378000)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @pet = Pet.new
  end
end
