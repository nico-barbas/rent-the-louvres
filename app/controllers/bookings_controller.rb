class BookingsController < ApplicationController
  def new
    raise
  end

  def create
    raise
  end

  def index
    @current_user = current_user
    @user_bookings = @current_user.bookings
    @user_bookings = policy_scope(Booking)
  end
end
