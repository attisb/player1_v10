class PagesController < ApplicationController
  def index
    @drinks = Drink.where(visible: true).order(created_at: :desc).limit(3)
    @events = Event.where('date >= ?', Date.today).order(date: :asc).limit(3)
  end
  
  def rules
  end
  
  def terms
  end
  
  def privacy
  end
  
  def drinks
    if params[:type] == "styles"
      @beer_styles = BeerStyle.order(name: :asc)
    elsif params[:type] == "brewery"
      if params[:by_letter]
        @breweries = Brewery.find_by_first_letter(params[:id])
      else
        @breweries = Brewery.order(name: :asc)
      end
    elsif params[:type] == "country"
      if params[:by_letter]
        @countries = Country.find_by_first_letter(params[:id])
      else
        @countries = Country.order(name: :asc)
      end
    elsif params[:type] == "state"
      @states = State.where(country_id: 233).order(name: :asc)
    else 
      @beer_groups = BeerGroup.where(visible: true).order(order: :asc, name: :asc)
    end
  end
end
