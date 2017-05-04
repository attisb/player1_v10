class Dashboard::BeerGroupsController < ApplicationController
  before_action :set_beer_group, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    if params[:visible] == "true" 
      @beer_groups = BeerGroup.where(visible: true).order(order: :asc, name: :asc).all
    elsif params[:visible] == "false"
      @beer_groups = BeerGroup.where(visible: false).order(order: :asc, name: :asc).all
    else
      @beer_groups = BeerGroup.order(order: :asc, name: :asc).all
    end
  end
  
  def show
  end
  
  def new
    @beer_group = BeerGroup.new
  end
  
  def create
    @beer_group = BeerGroup.new(beer_group_params)

    respond_to do |format|
      if @beer_group.save
        format.html { redirect_to [:dashboard, @beer_group], notice: 'Drink group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @beer_group.update(beer_group_params)
        format.html { redirect_to [:dashboard, @beer_group], notice: 'Drink group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @beer_group.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_beer_groups_url, notice: 'Drink group was successfully destroyed.' }
    end
  end


  private
    def set_beer_group
      @beer_group = BeerGroup.find(params[:id])
    end

    def beer_group_params
      if signed_in? && current_user.admin?
        params[:beer_group].permit(:name, :description, :order, :visible)
      end
    end
end
