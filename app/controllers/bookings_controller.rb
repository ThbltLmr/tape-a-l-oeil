class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @boxer = Boxer.find(params[:boxer_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boxer = Boxer.find(params[:boxer_id])
    @booking.price = ((@booking.end_date - @booking.start_date) * @booking.boxer.price_per_day).to_i
    @booking.status = "pending"
    @booking.save
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:address, :start_date, :end_date)
  end
end
