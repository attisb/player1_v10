class Dashboard::ScreenOrdersController < ApplicationController
  before_action :set_screen_order, only: [:update, :destroy]
  before_action :require_login
  before_action :check_if_admin
  
  
  def create
    @screen_order = ScreenOrder.new(screen_order_params)

    respond_to do |format|
      if @screen_order.save
        format.html { redirect_to dashboard_screen_path(params[:screen_order][:screen_id]), notice: 'Screen Order was successfully created.' }
      else
        format.html { redirect_to dashboard_screen_path(params[:screen_order][:screen_id]), alert: 'Screen Order was not created.' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @screen.update(screen_order_params)
        format.html { redirect_to dashboard_screen_path(@screen.screen_id), notice: 'Screen Order was successfully updated.' }
      else
        format.html { redirect_to dashboard_screen_path(@screen.screen_id), notice: 'Screen Order was not updated.' }
      end
    end
  end
  
  def destroy
    @screen.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_screen_path(@screen.screen_id), notice: 'Screen Order was successfully deleted.' }
    end
  end
  
  
  private
    def set_screen_order
      @screen = ScreenOrder.find(params[:id])
    end

    def screen_order_params
      if signed_in? && current_user.admin?
        params[:screen_order].permit(:playlist_id, :screen_id, :order)
      end
    end
  
  
end