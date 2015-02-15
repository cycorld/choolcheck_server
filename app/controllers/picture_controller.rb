class PictureController < ApplicationController
  layout "none"

  def new
    @klass_id = params[:klass_id]
  end

  def create
    redirect_to "/"
  end
end
