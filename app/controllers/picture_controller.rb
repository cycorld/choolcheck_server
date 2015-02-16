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
    redirect_to '/'
  end

  def signup
    user = User.where(email: params[:email], password: params[:password]).take
    unless user.nil?
      user.token = SecureRandom.hex
      user.save
      render json: {code: 1, result: user.token}
    else
      render json: {code: 0, result: "Login error"}
    end
  end

  def call_myclass
    user = User.where(email: params[:email], token: params[:token]).take
    if user.nil?
      render json: {code: 0, result: "Error"}
    else
      classes = Array.new
      user.created_klasses.each do |c|
        classes << {id: c.id, title: c.title}
      end
      render json: {code: 1,
                    result: classes
                    }
    end
  end

  def upload
    user = User.where(email: params[:email], token: params[:token]).take
    if user.nil?
      render json: {code: 0, result: "Error"}
    else
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
      render json: {code: 1, result: "Success"}
    end
  end
end
