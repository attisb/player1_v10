class Dashboard::BeerStylesController < ApplicationController
  before_action :set_beer_style, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    if params[:letter]
      @beer_styles = BeerStyle.find_by_first_letter(params[:letter]).order(name: :asc).all
    else
      @beer_styles = BeerStyle.order(name: :asc).all
    end
  end

  def show
  end

  def new
    @beer_style = BeerStyle.new
  end

  def create
    @beer_style = BeerStyle.new(beer_style_params)

    respond_to do |format|
      if @beer_style.save
        format.html { redirect_to [:dashboard, @beer_style], notice: 'Beer style was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @beer_style.update(beer_style_params)
        format.html { redirect_to [:dashboard, @beer_style], notice: 'Beer style was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @beer_style.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_beer_style_url, notice: 'Beer style was successfully destroyed.' }
    end
  end


  private
    def set_beer_style
      @beer_style = BeerStyle.find(params[:id])
    end

    def beer_style_params
      if signed_in? && current_user.admin?
        params[:beer_style].permit(:name, :description, :abv_range_start, :abv_range_end)
      end
    end
end