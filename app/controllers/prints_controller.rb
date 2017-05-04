class PrintsController < ApplicationController
  layout "printer", except: [:index]
  before_action :require_login
  before_action :check_if_mod

  def index
    @game_consoles = GameConsole.order(name: :asc).all
    @glass_size = BeerSize.order(name: :asc).all
  end

  def drafts
    drink_sizes = BeerSize.where(is_draft: true, use_tap_lis: true)
    @drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).group(:drink_id).order_by_name
    @beer_groups = BeerGroup.where(visible: true).order(order: :asc)
  end
  
  def bottles
    drink_sizes = BeerSize.where(is_draft: false, use_tap_lis: true)
    @drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).group(:drink_id).order_by_name
    @beer_groups = BeerGroup.where(visible: true).order(order: :asc)
  end
  
  def full
    drink_sizes = BeerSize.where(use_tap_lis: true)
    @drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).group(:drink_id).order_by_name
    @beer_groups = BeerGroup.where(visible: true).order(order: :asc)
  end
  
  def glass
    @drink_sizes = BeerSize.where(id: params[:id]).first
    @drinks = Price.where(available: true, beer_size_id: params[:id]).group(:drink_id).order_by_name
    @beer_groups = BeerGroup.where(visible: true).order(order: :asc)
  end
  
  def game
    @game_console = GameConsole.find(params[:id])
    @games = Game.includes(:game_consoles).where('game_consoles.id' => @game_console.id).all
  end
  
end
