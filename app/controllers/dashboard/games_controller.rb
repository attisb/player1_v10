class Dashboard::GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_mod

  def index
    @game_consoles = GameConsole.order(name: :asc).all
    if params[:console]
      @console = GameConsole.find(params[:console])
      @games = Game.includes(:game_consoles).where('game_consoles.id' => params[:console])
    else
      @games = Game.all
    end
  end

  def show
  end

  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to [:dashboard, @game], notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to [:dashboard, @game], notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_games_url, notice: 'Game was successfully destroyed.' }
    end
  end
    
  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      if signed_in? && (current_user.admin? || current_user.moderator?)
        params[:game].permit(:name, :description, :category_id, :cover_image, :hero_image, :release_date, :players, {:game_console_ids => []})
      end
    end
end
