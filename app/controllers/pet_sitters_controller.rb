class PetSittingsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  def index
    @pet_sitting = policy_scope(PetSitting).where(user: current_user)
    @pet_sittings_as_owner = policy_scope(PetSitting).where(pet_sitting: current_user.pet_sittings)
  end

  def show
    @pet_sitting = PetSitting.find(params[:id])
  end

  def new
    @pet_sitting = PetSitting.new
    autorize @pet_sitting
  end

  def create
    @pet_sitting = PetSitting.new(pet_sitting_params)
    authorize @pet_sitting
    @pet_sitting.user = @user
    if @pet_sitting.save
      redirect_to pet_sittings_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def pet_sitting_params
    params.require(:pet_sitting).permit(:description, :price, :user_id)
  end
end
