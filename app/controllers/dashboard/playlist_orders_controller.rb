class Dashboard::PlaylistOrdersController < ApplicationController
  before_action :set_playlist_order, only: [:update, :destroy]
  before_action :require_login
  before_action :check_if_admin
  
  
  def create
    @playlist_order = PlaylistOrder.new(playlist_order_params)

    respond_to do |format|
      if @playlist_order.save
        format.html { redirect_to dashboard_playlist_path(params[:playlist_order][:playlist_id]), notice: 'Playlist Order was successfully created.' }
      else
        format.html { redirect_to dashboard_playlist_path(params[:playlist_order][:playlist_id]), alert: 'Playlist Order was not created.' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @playlist.update(playlist_order_params)
        format.html { redirect_to dashboard_playlist_path(@playlist.playlist_id), notice: 'Playlist Order was successfully updated.' }
      else
        format.html { redirect_to dashboard_playlist_path(@playlist.playlist_id), notice: 'Playlist Order was not updated.' }
      end
    end
  end
  
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_playlist_path(@playlist.playlist_id), notice: 'Playlist Order was successfully deleted.' }
    end
  end
  
  
  private
    def set_playlist_order
      @playlist = PlaylistOrder.find(params[:id])
    end

    def playlist_order_params
      if signed_in? && current_user.admin?
        params[:playlist_order].permit(:playlist_id, :asset_id, :order)
      end
    end
  
  
end
