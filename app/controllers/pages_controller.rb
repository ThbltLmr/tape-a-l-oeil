class PagesController < ApplicationController
  def home
    @no_navbar = true
  end

  def dashboard
    @bookings = Booking.where(user: current_user)
    @status_done = Booking.where(user: current_user, status: "done").count
    @status_validated = Booking.where(user: current_user, status: "validated").count
    @status_pending = Booking.where(user: current_user, status: "pending").count
    @status_pending_boxer = Booking.where(boxer: current_user.boxer, status: "pending").count
    @status_validated_boxer = Booking.where(boxer: current_user.boxer, status: "validated").count
  end

  def chaewon
    @no_navbar = true
  end
end
