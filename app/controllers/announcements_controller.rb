class AnnouncementsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @announcements = policy_scope(Announcement)
    #change this to confirm the booking
    # @announcement = policy_scope(Announcement).where(user: current_user)
    # @announcements_as_owner = policy_scope(Announcement).where(announcement: current_user.pets)
  end

  def new
    @announcement = Announcement.new
    authorize @announcement
  end

  def create
    @announcement = Announcement.new(announcement_params)
    authorize @announcement
    @announcement.user = current_user
    if @announcement.save
      redirect_to announcements_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def announcement_params
    params.require(:announcement).permit(:date, :content, :location, :title, :user_id)
  end
end
