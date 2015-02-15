class DashboardController < ApplicationController
  before_action :authenticate_user!

  # sample
  def index
  end

  # class
  def notice
  end

  def new
  end

  def create
    c = Classes.new
    c.title = params[:class_name]
    c.description = params[:class_desc]
    c.admin = [current_user.id]
    if c.save
      redirect_to '/dashboard/choolers'
    else
      # TODO : exections in Model
      flash[:notice] = "something wrong"
      redirect_to '/dashboard/new'
    end
  end

  # check
  def choolers
  end

  def daily
  end

  # chool
  def pin
  end
end
