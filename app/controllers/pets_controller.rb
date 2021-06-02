class PetsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @pet = Pet.new
    @pet.user = @user
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = @user
    if @pet.save
      redirect_to user_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def pet_params
    params.require(:pet).permit(:pet_name, :birthdate, :species, :breed, :description, :user_id, :photo)
  end
end
