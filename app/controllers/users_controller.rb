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
  end
end
