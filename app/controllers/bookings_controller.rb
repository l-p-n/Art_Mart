class BookingsController < ApplicationController
  def create
    @artwork = Artwork.find(params[:artwork_id])
    @booking = Booking.new(booking_params)
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

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: "approved")
      if @booking.status == "approved"
        flash[:success] = "Booking successfully approved"
        redirect_to booking_path(@booking)
      else
        flash[:error] = "Booking not approved"
        redirect_to artworks_path
      end
  end

  private

  def booking_params
    # TODO: check if need to add :user_id and :artwork_id to strong params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
