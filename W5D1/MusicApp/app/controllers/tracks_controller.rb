class TracksController < ApplicationController

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    @album = Album.find_by(id: params[:album_id])
    @band = Band.find_by(id: @album.band_id)
    render :new
  end

  def create
    track = Track.new(track_params)
    # @album = Album.find_by(id: @track.album_id)

    if track.save
      redirect_to track_url(track)
    else
      flash.now[:errors] = track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
    @band = Band.find_by(id: @album.band_id)
    render :edit
  end

  def update
    track = Track.find_by(id: params[:id])
    if track.nil?
      flash[:errors] = ["Couldn't find track"]
      redirect_to bands_url
    elsif track.update_attributes(track_params)
      redirect_to track_url(track)
    else
      flash[:errors] = track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    if track.nil?
      flash[:errors] = ["Couldn't find track"]
      redirect_to bands_url
    else
      track.destroy
      redirect_to bands_url
    end
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :bonus, :lyrics)
  end
end
