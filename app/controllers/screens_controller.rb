class ScreensController < ApplicationController
  layout false
  
  def list
    @screen = Screen.where(codeword: params[:codeword]).first
    unless @screen.nil?
      @screen_orders = ScreenOrder.where(screen_id: @screen.id)
      if @screen_orders.count == 0
        if @screen.direction == "h"
          @default_graphic = Asset.where(name: "loading-horizontal").first
        else
          @default_graphic = Asset.where(name: "loading-vertical").first
        end
      end
    end
    
    respond_to do |format|
      format.text
    end
  end
  
  def menu
    @screen = Screen.where(codeword: params[:codeword]).first
    unless @screen.nil?
      if @screen.direction == 'v'
        @screen_menu_count = 3
      else
        @screen_menu_count = 3
      end
      
      # Draft Menu
      @draft_pages = 1
      @draft_count = 0
			drink_sizes = BeerSize.where(is_draft: true, use_tap_lis: true)
			@draft_drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).group(:drink_id).order_by_name
      @draft_drinks.each do
        @draft_count = @draft_count + 1
      end
      @draft_pages = @draft_count / @screen_menu_count
      
      # Bottle Menu
      @bottle_pages = 1
      @bottle_count = 0
      drink_sizes = BeerSize.where(is_draft: false, use_tap_lis: true)
      @bottle_drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).where.not(amount: [nil, '']).order_by_name
      @bottle_drinks.each do
        @bottle_count = @bottle_count + 1
      end
      @bottle_pages =  @bottle_count / @screen_menu_count unless @bottle_count < @screen_menu_count
      


      @screen_orders = ScreenOrder.where(screen_id: @screen.id)
    end
    
    respond_to do |format|
      format.html
    end
  end
  
  
  def game
    @screen = Screen.where(codeword: params[:codeword]).first
    unless @screen.nil?
      if @screen.direction == 'v'
        @screen_menu_count = 3
      else
        @screen_menu_count = 3
      end
    end
    
    @consoles = GameConsole.where(tier: 1)
  end
  
end
