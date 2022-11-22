class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @artworks = policy_scope(Artwork)
    @artworks = @artworks[0...50]
  end

  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @booking = Booking.new
  end
end
