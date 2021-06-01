class AnnouncementsController < ApplicationController
  before_action :set_pet, only: [:new, :create]

  def index
    @announcement = policy_scope(Announcement).where(user: current_user)
    @announcements_as_owner = policy_scope(Announcement).where(announcement: current_user.pet)
  end

  def new
    @annoucement = Announcement.new
    autorize @anouncement
  end

  def create
    @announcement = Announcement.new(announcement_params)
    autorize @anouncement
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
    @user = User.find(params[:user_id])
    @pet = @user.pet
  end

  def announcement_params
    params.require(:annoucement).permit(:date, :content, :location, :status, :pet)
  end
end
