require 'byebug'

class ArtworksController < ApplicationController

  # GET /artworks
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  # GET /artworks/:id
  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  # PUT /artworks/:id
  # PATCH /artworks/:id
  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      render json: @artwork
    else
      if @artwork.nil?
        render json: {message:["Artwork was not found."]}
      else
        render json: @artwork.errors.full_messages, status: 422
      end
    end
  end

  # DELETE /artworks/:id
  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    render json: @artwork
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end