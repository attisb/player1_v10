class DrinksController < ApplicationController

  def index
    
    # Beer Groups
    if params[:type] == "group"
      @page_name = BeerGroup.find(params[:id])
      @drinks = Drink.where(visible: true).where(beer_group_id: params[:id]).order(name: :asc)

    # On Draft Only
    elsif params[:type] == "draft"
      drink_sizes = BeerSize.where(is_draft: true, use_tap_lis: true)
      @drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).group(:drink_id).order_by_name
      
    # In Bottles & Cans
    elsif params[:type] == "bottle"
      drink_sizes = BeerSize.where(is_draft: false, use_tap_lis: true)
      @drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).where.not(amount: [nil, '']).order_by_name
      
    # By Beer Styles
    elsif params[:type] == "styles"
      @page_name = BeerStyle.find(params[:id])
      @drinks = Drink.where(visible: true, beer_style_id: params[:id]).order(name: :asc)
      
    # Latest Added (New)
    elsif params[:type] == "latest"
      # @drinks = Drink.where(visible: true).order(created_at: :desc).limit(10)
      @drinks = Price.where(available: true, is_new: true).group(:drink_id)
      
    # Coming Soon
    elsif params[:type] == "soon"
      @drinks = Drink.where(coming_soon: true).order(name: :asc).limit(10)
    
    # On Special
    elsif params[:type] == "special"
      @drinks = Price.where(available: true, is_special: true).group(:drink_id)

    # By Brewery
    elsif params[:type] == "brewery"
      @page_name = Brewery.find(params[:id])
      @drinks = Drink.where(brewery_id: params[:id]).order(name: :asc)

    # By Country
    elsif params[:type] == "country"
      @breweries = Brewery.where(country_id: params[:id]).order(name: :asc)

    # By US State
    elsif params[:type] == "state"
      @breweries = Brewery.where(state_id: params[:id]).order(name: :asc)
    
    # By Color
    elsif params[:type] == "color"
      @drinks = Drink.where(color: params[:color]).order(name: :asc)
      
    # Unknown Variable Show 50
    else
      @drinks = Drink.limit(50)
    end

    if signed_in?
      @user_drinks = UserHad.where(user_id: 1)
    end

  end
  
  def show
    @drink = Drink.find(params[:id])
    @similar = Drink.where(beer_style_id: @drink.beer_style_id).where.not(id: @drink.id).limit(3)
    @brewery = Drink.where(brewery_id: @drink.brewery_id).limit(5)
    
    if signed_in?
      @note = Note.new(:user_id => current_user.id, :drink_id => @drink.id)
    end
    
  end

end
