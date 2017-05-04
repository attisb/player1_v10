class Dashboard::SearchController < ApplicationController
  before_action :require_login
  before_action :check_if_mod

  def index
  end

  def results
    if params[:type] == "drinks"
      @drinks = Drink.where("name LIKE ?", "%#{params[:k]}%")
    elsif params[:type] == "games"
      @games = Game.where("name LIKE ?", "%#{params[:k]}%")
    elsif params[:type] == "breweries"
      @breweries = Brewery.where("name LIKE ?", "%#{params[:k]}%")
    elsif params[:type] == "all"
      @drinks = Drink.where("name LIKE ?", "%#{params[:k]}%")
      @breweries = Brewery.where("name LIKE ?", "%#{params[:k]}%")
      @games = Game.where("name LIKE ?", "%#{params[:k]}%")
    end
  end
end
