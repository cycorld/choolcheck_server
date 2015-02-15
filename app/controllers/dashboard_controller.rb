class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :load_classes

  # sample
  def index
  end

  # class
  def notice
  end

  def new
  end

  def create
    c = Klass.new
    c.title = params[:class_name]
    c.description = params[:class_desc]
    c.admin = [current_user.id]
    if c.save
      redirect_to "/classbook/#{c.id}"
    else
      # TODO : exections in Model
      flash[:notice] = "something wrong"
      redirect_to "/create"
    end
  end

  def add_chooler
    # user update or create
    user = User.find_or_create(params)
    # classbook add or none
    Classbook.find_or_link(
      params[:class_id],
      user,
      current_user
    )
    redirect_to :back
  end

  # check
  def choolers
    # TODO : need to order by name
    @choolers = Classbook.where(klass_id: params[:class_id]).reverse
    @class_id = params[:class_id]
  end

  def daily
  end

  # chool
  def pin
    @class = Klass.find(params[:id])
    @albums = @class.albums
    @unchecked_albums = @class.unchecked_albums
    @album = Album.pick(@class, params[:current])
  end
end
