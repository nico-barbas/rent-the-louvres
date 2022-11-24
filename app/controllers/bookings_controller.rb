class BookingsController < ApplicationController
  def create
    @booking_params = booking_params
    @booking = Booking.new(@booking_params)
    @booking.user = current_user
    @booking.artwork = Artwork.find(params[:artwork_id])
    @booking.duration = @booking.end_date - @booking.start_date
    @booking.total_price = @booking.artwork.price_per_day * (@booking.duration)
    authorize @booking
    if @booking.save
      redirect_to :bookings
    else
      render @booking.artwork, status: :unprocessable_entity
    end
  end

  def index
    @today = Date.today
    @user = current_user
    # @user_bookings = @user.bookings
    @user_bookings = policy_scope(Booking)
    @user_future_bookings = @user_bookings.select do |booking|
      booking.start_date >= @today
    end
    @user_past_bookings = @user_bookings.select do |booking|
      booking.start_date < @today
    end
    # @user_bookings = policy_scope(Booking)
    @review = Review.new
    # authorize @review

  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    return params.require("booking").permit(:start_date, :end_date)
   end
end
