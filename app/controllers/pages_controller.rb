class PagesController < ApplicationController

  def index
    @classes = Klass.all
    if user_signed_in?
      redirect_to '/notice'
    end
  end

  def blank_page
       render :layout => "application"
  end

  def profile
      render :layout => "application"
  end

  def signon
      render :layout => "pages"
  end

  def signup
      render :layout => "pages"
  end


  def locked_screen
      render :layout => "pages"
  end


  def page404
      render :layout => "pages"
  end

  def page500
      render :layout => "pages"
  end


end
