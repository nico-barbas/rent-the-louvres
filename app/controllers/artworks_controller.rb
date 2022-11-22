class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all[0...50]
  end
end
