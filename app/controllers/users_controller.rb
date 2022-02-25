class UsersController < ApplicationController
  def show
    @user = current_user
    @artworks = @user.artworks
    # @bookings = @user.artworks.bookings
    # @bookings.flatten
    @rentals = @user.bookings
    @artworks_bookings = Booking.all.select do |booking|
      booking.artwork.user == current_user
    end
    @pending_artworks_bookings = @artworks_bookings.select do |booking|
      booking.status != "approved" || "declined"
    end
  end
end
