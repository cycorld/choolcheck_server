class PictureController < ApplicationController
  skip_before_filter :verify_authenticity_token

  layout "none"

  def new
    @klass_id = params[:klass_id]
  end

  def create
    # just one shot!!!!!
    # need to make album
    album = Album.new
    album.klass_id = params[:klass_id]
    album.save
    # upload picture
    p = Picture.new
    p.album_id = album.id
    p.picture = params[:file]
    p.save
    redirect_to "/"
  end
end
