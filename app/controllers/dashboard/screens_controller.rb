class Dashboard::ScreensController < ApplicationController
  before_action :set_screen, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    if params[:type]
      @screens = Screen.where(screen_type: params[:type]).order(name: :asc).all
    else
      @screens = Screen.order(name: :asc).all
    end
  end

  def show
    @screen_order = ScreenOrder.new
    @screen_orders = ScreenOrder.where(screen_id: @screen.id)
    @playlists = Playlist.where(direction: @screen.direction).all
  end

  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)

    respond_to do |format|
      if @screen.save
        format.html { redirect_to [:dashboard, @screen], notice: 'Screen was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @screen.update(screen_params)
        format.html { redirect_to [:dashboard, @screen], notice: 'Screen was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @screen.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_screens_url, notice: 'Screen was successfully destroyed.' }
    end
  end
  
  private
    def set_screen
      @screen = Screen.find(params[:id])
    end

    def screen_params
      if signed_in? && current_user.admin?
        params[:screen].permit(:name, :direction, :location, :screen_type, :enabled, :show_menu, :codeword)
      end
    end
  
  
  
end
