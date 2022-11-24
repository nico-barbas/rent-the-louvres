class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    authorize @review
    @artwork = Artwork.find(params[:artwork_id])
    @review.artwork = @artwork
    @review.user = current_user
    @review.save

    redirect_to artwork_path(@artwork)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
