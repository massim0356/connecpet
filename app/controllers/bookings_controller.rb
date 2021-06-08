class BookingsController < ApplicationController
  before_action :set_pet_sitting, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
    # as an owner
    @bookings_as_owner = policy_scope(Booking).where(pet_sitting: current_user.pet_sitting)
  end

  def new
    set_petsitting
    @booking = Booking.new
    # pundit
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    # pundit ----
    @booking.user = current_user
    @booking.pet_sitting = @pet_sitting
    if @booking.save
      flash[:notice] = "Booking request sent."
      redirect_to pet_sitting_path(@pet_sitting)
    else
      render "pet_sittings/show"
    end
  end

  # def update
  #   @booking = Booking.find(params[:pet_sitting_id])
  #   # pundit
  #   authorize @booking
  #   if @booking.update(booking_params)
  #     redirect_to bookings_path
  #   else
  #     render :bookings_path
  #   end
  # end


private

  def set_pet_sitting
    @pet_sitting = PetSitting.find(params[:pet_sitting_id])
  end

  def booking_params
    params.require(:booking).permit(:description, :status, :start_date, :end_date, :petsitting_id, :user_id)
  end

end
