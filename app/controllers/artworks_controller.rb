class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.save
    redirect_to @artwork
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
    params.require(:artwork).permit(:title, :style, :description, :artist, :date, :price_per_day)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :price_per_day, :artist, :style, :user_id, :description, :date)
  end

end
