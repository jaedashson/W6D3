class ArtworkSharesController < ApplicationController
  # GET / artwork_shares
  def index
    @artwork_shares = ArtworkShare.all
    render json: @artwork_shares
  end

  # GET /artwork_shares/:id
  def show
    @artwork_share = ArtworkShare.find(params[:id])
    render json: @artwork_share
  end

  # POST /artwork_shares
  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)

    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: 422
    end
  end

  # DELETE /artwork_shares/:id
  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    @artwork_share.destroy
    render json: @artwork_share
  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end