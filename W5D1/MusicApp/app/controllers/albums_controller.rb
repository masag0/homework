class AlbumsController < ApplicationController

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.find_by(id: params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find_by(id: @album.band_id)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.nil?
      flash[:errors] = ["Couldn't find album"]
      redirect_to bands_url
    elsif album.update_attributes(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    if album.nil?
      flash[:errors] = ["Couldn't find album"]
      redirect_to bands_url
    else
      album.destroy
      redirect_to bands_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
