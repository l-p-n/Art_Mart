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
    @pending_artworks_bookings = @user.bookings.select do |booking|
      (booking.status != "approved") && (booking.status != "declined")
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :photo)
  end
end
