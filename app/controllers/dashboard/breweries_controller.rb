class Dashboard::BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_mod
  
  
  def index
    if params[:letter]
      @breweries = Brewery.find_by_first_letter(params[:letter])
    else
      @breweries = Brewery.all.limit(30).order(created_at: :asc)
    end
  end

  def new
    @brewery = Brewery.new
    @countries = Country.order(name: :asc).all
  end
  
  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to [:dashboard, @brewery], notice: 'Brewery was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @countries = Country.order(name: :asc).all
  end
  
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to [:dashboard, @brewery], notice: 'Brewery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @brewery.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_breweries_url, notice: 'Brewery was successfully destroyed.' }
    end
  end

  def show
  end
  
  private
    def set_brewery
      @brewery = Brewery.find(params[:id])
    end

    def brewery_params
      if signed_in? && (current_user.admin? || current_user.moderator?)
        params[:brewery].permit(:name, :display_name, :country_id, :state_id, :established, :description, :facebook, :twitter, :instagram, :website)
      end
    end
end
