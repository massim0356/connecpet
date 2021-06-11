class RegistrationsController < ApplicationController
  def create
    @registration = Registration.new
    authorize @registration
    @registration.user = current_user
    @registration.announcement = Announcement.find(params[:announcement_id])
    if @registration.save
      redirect_to announcements_path
    end
  end
end
