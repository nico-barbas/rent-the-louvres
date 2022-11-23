class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review])
    @review.save
    redirect_to artwork_path(@artwork)
  end

  private
  def review_params
    params.require(:reviw).permit(:comment, :rating)
  end
end
