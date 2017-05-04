class Dashboard::BeerSizesController < ApplicationController
  before_action :set_beer_size, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    @beer_sizes = BeerSize.order(name: :asc).all
  end

  def show
  end

  def new
    @beer_size = BeerSize.new
  end

  def create
    @beer_size = BeerSize.new(beer_size_params)

    respond_to do |format|
      if @beer_size.save
        format.html { redirect_to [:dashboard, @beer_size], notice: 'Beer size was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @beer_size.update(beer_size_params)
        format.html { redirect_to [:dashboard, @beer_size], notice: 'Beer size was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @beer_size.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_beer_sizes_url, notice: 'Beer size was successfully destroyed.' }
    end
  end


  private
    def set_beer_size
      @beer_size = BeerSize.find(params[:id])
    end

    def beer_size_params
      if signed_in? && current_user.admin?
        params[:beer_size].permit(:name, :image, :is_draft, :use_tap_lis)
      end
    end
end
