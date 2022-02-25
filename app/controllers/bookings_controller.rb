class BookingsController < ApplicationController
  def create
    @artwork = Artwork.find(params[:artwork_id])
    @booking = Booking.new(booking_params)
    @booking.artwork = @artwork
    @booking.user = current_user
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
        flash[:notice] = "Booking successfully approved"
        redirect_to user_path(current_user, anchor: my-rentals)
      end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "declined")
      if @booking.status == "declined"
        flash[:notice] = "Booking declined"
        redirect_to user_path(current_user, anchor: my-rentals)
      end
  end

  private

  def booking_params
    # TODO: check if need to add :user_id, :status and :artwork_id to strong params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
