class ArtworksController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
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

end
