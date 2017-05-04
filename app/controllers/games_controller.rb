class GamesController < ApplicationController
  def index
    if params[:type] == "system"
      @game_system = GameConsole.find(params[:id])
      @categories = Category.where(bucket_type: 'games')
    elsif params[:type] == "category"
      @games = Game.includes(:game_consoles).where(category_id: params[:id]).where('game_consoles.id' => params[:console])
    else
      game_systems = GameConsole.where(visible: true).order(name: :asc).all
      @game_systems1 = game_systems.where(tier: 1)
      @game_systems2 = game_systems.where(tier: 2)
      @game_systems3 = game_systems.where(tier: 3)
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
