class Dashboard::DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_mod
  
  
  def index
    if params[:letter]
      @drinks = Drink.find_by_first_letter(params[:letter])
    else
      @drinks = Drink.limit(30).all
    end
  end

  def show
  end

  def new
    @drink = Drink.new
    @beer_styles = BeerStyle.all
    @beer_groups = BeerGroup.all
    @breweries = Brewery.all
    @beer_sizes = BeerSize.all
    @beer_sizes.each { |l| @drink.prices.build(beer_size: l) }
  end
  
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to [:dashboard, @drink], notice: 'Drink was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @beer_styles = BeerStyle.all
    @beer_groups = BeerGroup.all
    @breweries = Brewery.all
    @beer_sizes = BeerSize.all
    beer_sizes_t = @beer_sizes.map(&:id) - @drink.prices.map(&:beer_size_id)
    beer_sizes_t.each do |id|
        @drink.prices.build(beer_size_id: id)
      end
  end
  
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        if params[:tap_list] == "true"
          format.html { redirect_to dashboard_drafts_path, notice: 'Drink was successfully updated.' }          
        elsif params[:available] == "true"
          format.html { redirect_to dashboard_availables_path, notice: 'Drink was successfully updated.' }          
        else
          format.html { redirect_to [:dashboard, @drink], notice: "Drink was successfully updated." }
        end
      else
        @beer_styles = BeerStyle.all
        @beer_groups = BeerGroup.all
        @breweries = Brewery.all
        @beer_sizes = BeerSize.all
        beer_sizes_t = @beer_sizes.map(&:id) - @drink.prices.map(&:beer_size_id)
        beer_sizes_t.each do |id|
            @drink.prices.build(beer_size_id: id)
          end
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @drink.destroy
    @drink.prices.destroy_all
    respond_to do |format|
      format.html { redirect_to dashboard_drinks_url, notice: 'Drink was successfully destroyed.' }
    end
  end


  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      if signed_in? && (current_user.admin? || current_user.moderator?)
        # params[:drink].permit(:name, prices_attributes: [:beer_size_id, :amount])
        params[:drink].permit(:name, :abv, :ibu, :visible, :beer_group_id, :beer_style_id, :brewery_id, :description, :short_description, :color, :image, :coming_soon, prices_attributes: [:id, :amount, :beer_size_id, :available, :is_new, :is_special, :is_returning, :_destroy] )
      end
    end    
  
end
