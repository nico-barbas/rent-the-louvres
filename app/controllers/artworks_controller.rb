class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @artworks = policy_scope(Artwork)
    @artworks.each do |artwork|
      if artwork.images.length > 1
        puts artwork.creator
      end
    end
    if params[:query].present?
      sql_query = "title ILIKE :query OR creator ILIKE :query"
      @artworks = Artwork.where(sql_query, query: "%#{params[:query]}%")
    else
      @artworks = @artworks[0...50]
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @booking = Booking.new
  end
end
