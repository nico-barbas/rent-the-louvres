MEDIUMS = ["Painting", "Print", "Drawing", "Sculpture"]

class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @artworks = policy_scope(Artwork)
    if params[:query].present?
      sql_query = "title ILIKE :query OR creator ILIKE :query"
      @artworks = Artwork.where(sql_query, query: "%#{params[:query]}%")
      category = params.require("category").permit(:name)
      @artworks = @artworks.where(medium: category[:name])
    else
      @artworks = @artworks[0...50]
    end

    @categories = MEDIUMS
  end

  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @booking = Booking.new
    @reviews = @artwork.reviews
  end
end
