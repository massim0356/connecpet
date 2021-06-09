class AnnouncementsController < ApplicationController
  before_action :set_pet, only: [:new, :create]

  def index
    @announcements = policy_scope(Announcement)
    #change this to confirm the booking
    @bookings = current_user.bookings
    # @announcement = policy_scope(Announcement).where(user: current_user)
    # @announcements_as_owner = policy_scope(Announcement).where(announcement: current_user.pets)
  end

  def new
    @announcement = Announcement.new
    set_pet
    authorize @announcement
  end

  def create
    @announcement = Announcement.new(announcement_params)
    authorize @announcement
    @announcement.pet = @pet
    @announcement.user = current_user
    if annoucement.save
      redirect_to annoucement_path
    else
      render :new
    end
  end

  private

  def set_pet
    @user = current_user
    @pet = @user.pets
  end

  def announcement_params
    params.require(:annoucement).permit(:date, :content, :location, :status, :pet)
  end
end
