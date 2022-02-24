class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @artworks = Artwork.search_by_title_and_artist(params[:query])
    else
      @artworks = Artwork.all
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @booking = Booking.new
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save
      redirect_to @artwork
    else
      render :new
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)

    redirect_to artwork_path(@artwork)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :price_per_day, :artist, :style, :user_id, :description, :date, :photo)
  end

end
