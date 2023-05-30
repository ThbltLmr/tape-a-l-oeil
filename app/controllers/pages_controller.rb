class PagesController < ApplicationController
  def home
    @no_navbar = true
  end

  def dashboard
    @current_user = current_user.id
    @bookings = Booking.where(user_id: @current_user)
    @status_done = Booking.where(user_id: @current_user, status: "done").count
    @status_validated = Booking.where(user_id: @current_user, status: "validated").count
    @status_pending = Booking.where(user_id: @current_user, status: "pending").count
  end
end
