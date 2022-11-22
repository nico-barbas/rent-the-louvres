class BookingsController < ApplicationController
  def new
    raise
  end

  def create
    raise
  end

  def index
    @today = Date.today
    @user = current_user
    # @user_bookings = @user.bookings
    @user_bookings = policy_scope(Booking)
    @user_future_bookings = @user_bookings.select do |booking|
      p booking.start_date >= @today
    end
    @user_past_bookings = @user_bookings.select do |booking|
      booking.start_date < @today
    end
    # @user_bookings = policy_scope(Booking)
  end
end
