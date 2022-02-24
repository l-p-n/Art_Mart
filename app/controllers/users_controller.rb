class UsersController < ApplicationController
  def show
    @user = current_user
    @artworks = @user.artworks
    @bookings = @user.artworks.bookings
    @rentals = @user.bookings
  end
end
