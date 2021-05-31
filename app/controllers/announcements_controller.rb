class AnnouncementsController < ApplicationController
  before_action :set_pet, only: [:new, :create]

  def index
    @annoucements = Announcement.all
  end

  def new
    @annoucement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
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
