require 'byebug'

class ArtworksController < ApplicationController

  # GET /artworks
  # GET /users/:user_id/artworks <--NESTED ROUTE
  def index
    if params.has_key?(:user_id) # # GET /users/:user_id/artworks
      @artworks = Artwork.joins(:shares)
        .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", params[:user_id], params[:user_id])
        # Why do we not get duplicates if an artwork belongs to
        # a user and has been shared with that user?
    else # GET /artworks
      @artworks = Artwork.all
    end
    
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