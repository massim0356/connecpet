class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @pet = Pet.new
    @pet.user = current_user
    authorize @pet
  end

  def create
    @pet = Pet.create(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to user_path(@pet.user)
    else
      render "pets/pets"
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
