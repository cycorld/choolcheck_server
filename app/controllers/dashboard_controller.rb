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
    @class = Klass.find(params[:class_id])
    day = params[:YYYYMMDD] || ""
    @date = DateTime.new(day[0..3].to_i, # 1987
                         day[4..5].to_i, # 03 Mar
                         day[6..7].to_i  # 03
                        )
    @albums = @class.albums
  end

  # chool
  def pin
    @class = Klass.find(params[:id])
    @albums = @class.albums
    @unchecked_albums = @class.unchecked_albums current_user
    @album = Album.pick(@class, params[:current], current_user.id)
    redirect_to '/dashboard/daily' if @album.nil?
  end

  def save_pin
    # TODO : validate duplicate pin
    # TODO : validate only my picture
    pin = Check.new
    pin.coordinate = params[:hiddenpin]
    pin.note = params[:note]
    pin.picture_id = params[:picture_id]
    pin.user_id = current_user.id
    if pin.coordinate.nil?
      status = 2
    else
      status = 1
    end
    pin.status = status
    pin.save
    redirect_to :back
    #render :text => "coord : #{params[:hiddenpin]}, album_id: #{params[:picture_id]}, note: #{params[:note]}"
  end
end
