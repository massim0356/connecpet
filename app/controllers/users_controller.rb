class UsersController < ApplicationController
  def index
    users = User.where.not(id: current_user.id)
    @users = policy_scope(users).near([current_user.latitude, current_user.longitude], 378000)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @pet = Pet.new
  end
end
