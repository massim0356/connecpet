class ReviewsController < ApplicationController

  def new
    @pet_sitting = PetSitting.find(params[:pet_sitting_id])
    @review = Review.new
  end

  def create
  @review = Review.new(review_params)
  @pet_sitting = PetSitting.find(params[:pet_sitting_id])
  @review.pet_sitting = @pet_sitting
  @review.user = current_user
  authorize @review
   if @review.save
    redirect_to pet_sitting_path(@pet_sitting)
   else
    render :pet_sitting_path
  end
end

  private

  def review_params
    params.require(:review).permit(:stars, :content, :pet_sitting_id)
  end
end
