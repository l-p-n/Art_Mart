class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @artwork = Artwork.find(params[:artwork_id])
    @booking.artwork = @artwork
    @booking.user = current_user
    # TODO: correct the paths below!!
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'artworks/show'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    # TODO: check if need to add :user_id and :artwork_id to strong params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
