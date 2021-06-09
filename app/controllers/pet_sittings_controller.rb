class PetSittingsController < ApplicationController
  def index
    users = policy_scope(User)
    users = users.near([current_user.latitude, current_user.longitude], 100)
    @pet_sittings = policy_scope(PetSitting).where(user: users.map(&:id))
    # order by closest pet sitter?
  end

  # if your booking form is in the show, you should make the instance variable in the show you dumbo
  def show
    @pet_sitting = PetSitting.find(params[:id])
    authorize @pet_sitting
    @booking = Booking.new
    @review = Review.new
    # to access photo, @pet_sitting.user because the pet sitting belongs to the user
  end

  def new
    @pet_sitting = PetSitting.new
    @pet_sitting.user = current_user
    authorize @pet_sitting
  end

  def create
    @pet_sitting = PetSitting.new(pet_sitting_params)
    authorize @pet_sitting
    @pet_sitting.user = current_user
    if @pet_sitting.save
      redirect_to pet_sittings_path
    else
      render :new
    end
  end

  private

  def pet_sitting_params
    params.require(:pet_sitting).permit(:description, :price, :user_id, :photo)
  end
end
