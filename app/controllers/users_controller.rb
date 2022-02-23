class UsersController < ApplicationController
  def show
    @user = current_user
    @artworks = @user.artworks
    # @bookings = @user.bookings
  end
end
