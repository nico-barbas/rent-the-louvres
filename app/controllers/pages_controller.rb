class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :artworks, :artwork]
  def home
  end
end
