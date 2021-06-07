class BookingsController < ApplicationController
  before_action :set_petsitting, only: [:new, :create]

  def index
    #non-pundit
    @bookings = Booking.all

    #pundit
    # @bookings = policy_scope(Booking).where(user: current_user)
    # # as an owner
    # @bookings_as_owner = policy_scope(Booking).where(petsitting: current_user.petsitting)
  end


  def new
    set_petsitting
    @booking = Booking.new
    # pundit
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    # authorize @booking
    set_petsitting
    # pundit ----
    # @booking.user = current_user
    @booking.petsitting = @petsitting
    if @booking.save
      redirect_to bookings_path
    else
      render "pet_sittings/show"
    end
  end

  def update
    @booking = Booking.find(params[:petsitting_id])
    # pundit
    # authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :bookings_path
    end
  end


private

  def set_petsitting
    @petsitting = Petsitting.find(params[:petsitting_id])
  end

  def booking_params
    params.require(:booking).permit(:description, :status, :start_date, :end_date, :petsitting_id, :user_id)
  end
end
