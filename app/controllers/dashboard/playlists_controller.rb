class Dashboard::PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    @playlists = Playlist.order(name: :asc).all
  end

  def show
    @playlist_order = PlaylistOrder.new
    @playlist_orders = PlaylistOrder.where(playlist_id: @playlist.id)
    @assets = Asset.all
  end

  def new
    @assets = Asset.all
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to [:dashboard, @playlist], notice: 'Playlist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to [:dashboard, @playlist], notice: 'Playlist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_playlists_url, notice: 'Playlist was successfully destroyed.' }
    end
  end
  
  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      if signed_in? && current_user.admin?
        params[:playlist].permit(:name, :direction, :date_show, :screen_id, :enabled)
      end
    end
  
  
  
end
