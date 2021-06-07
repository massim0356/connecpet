class ReviewsController < ApplicationController

  def new
    @petsitting = Petsitting.find(params[:petsitting_id])
    @review = Review.new
  end

  def create
  @review = Review.new(review_params)
  @petsitting = Petsitting.find(params[:petsitting_id])
  @review.petsitting = @petsitting
   if @review.save
    redirect_to petsitting_path(@petsitting)
   else
    render :petsitting_path
  end
end

  private

  def review_params
    params.require(:reviews).permit(:stars, :content, :petsitting_id, :user_id)
  end
end
